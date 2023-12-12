//
//  ArtPiece.swift
//  MuseumAPI
//
//  Created by jose Yun on 12/10/23.
//

import Foundation
import SwiftUI

struct ArtPiece: Equatable {
    
    var title: String?
    var paintingDate: String?
    var author: String?
    var authorBirthDate: String?
    var description: String?
    var imageURL: String?
    var colors: [SwiftUI.Color] = []
}
