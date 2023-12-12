//
//  PieceSaver.swift
//  MuseumAPI
//
//  Created by jose Yun on 12/10/23.
//

import Foundation
import SwiftUI
import Combine

class PieceSaver: ObservableObject {
    
    static let shared = PieceSaver()
    
    private init() {}
    
    var fetchSuccess = PassthroughSubject<(), Never>()
    
    var artPieces: [ArtPiece] = []
    
    let apiKey = "13f9b803-e01f-4970-b563-58ca6a425f30"

    @MainActor
    func fetchArtFromAPI() async throws {
        let url = URL(string: "https://api.harvardartmuseums.org/object?apikey=13f9b803-e01f-4970-b563-58ca6a425f30&century=37525806&q=totalpageviews:>3500 AND classification:\"Paintings\"")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decoder = JSONDecoder()
        // Date 양식 Double 인식 방지
        decoder.dateDecodingStrategy = .iso8601
        let decoded = try decoder.decode(Welcome.self, from: data)
        
        decoded.records.forEach { record in
            
            // Only when image exists
            if let images = record.images, let people = record.people, !images.isEmpty {
                var artPiece = ArtPiece()
                
                artPiece.title = record.title
                artPiece.paintingDate = record.dated
                artPiece.author = people[0].displayname
                artPiece.authorBirthDate = people[0].displaydate
                artPiece.description = images[0].description
                artPiece.imageURL = images[0].baseimageurl
                record.colors.forEach { color in
                    let convertColor = SwiftUI.Color(hexString: color.color)
                    artPiece.colors.append(convertColor)
                }
                
                artPieces.append(artPiece)
            }
        }
        
        self.fetchSuccess.send()
    }
    
    func fetchImage(url: URL) async throws -> UIImage {
        let request = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: request)
            
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode,
                  (200...299).contains(statusCode) else { throw NSError(domain: "fetch error", code: 1004) }
        guard let image = UIImage(data: data) else { throw NSError(domain: "image coverting error", code: 999) }

        return image
    }
}
