//
//  ArtPieceView.swift
//  MuseumAPI
//
//  Created by jose Yun on 12/10/23.
//

import SwiftUI

struct ArtPieceView: View {
    @EnvironmentObject var pieceSaver: PieceSaver
    @State var image: UIImage = UIImage()
    @State var isShowingImage: Bool = false
    @State var counter: Int = 0
    @State var opacity: Double = 0.0
    var body: some View {
        HStack(spacing: 16) {
            
            Button(action: { counter -= 1}) {
                SwiftUI.Image(systemName: "arrowtriangle.backward.fill")
            }
            .foregroundStyle(.black)
            .disabled(counter == 0)
            
            VStack(alignment: .leading) {
                VStack(alignment: .center) {
                    ZStack {
                        ColorsView(colors: pieceSaver.artPieces[counter].colors, isShowingImage: $isShowingImage)
                        
                        if isShowingImage {
                            SwiftUI.Image(uiImage: self.image)
                                .resizable()
                                .scaledToFit()
                                .opacity(self.opacity)
                                .mask {
                                    RoundedRectangle(cornerRadius: 8.0)
                                }
                                .onAppear {
                                    withAnimation(.linear(duration: 1.0)) {
                                        opacity = 1.0
                                    }
                                }
                                .onDisappear {
                                    opacity = 0.0
                                }
                            
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width * 0.7, height: UIScreen.main.bounds.height * 0.3)
                
                Text("\(pieceSaver.artPieces[counter].title!), \(pieceSaver.artPieces[counter].paintingDate!)")
                    .font(.title)
                if let author = pieceSaver.artPieces[counter].author, let birthdate = pieceSaver.artPieces[counter].authorBirthDate {
                    Text("\(author), \(birthdate)")
                        .font(.title2)
                }
                
                HStack {
                    Spacer(minLength: 30)
                    VStack(alignment: .leading) {
                        if let description = pieceSaver.artPieces[counter].description {
                            Text("\(description)")
                                .font(.caption)
                        }
                    }
                }
            }
            Button(action: { counter += 1}) {
                SwiftUI.Image(systemName: "arrowtriangle.forward.fill")
            }
            .foregroundStyle(.black)
            .disabled(counter == pieceSaver.artPieces.count - 1)
        }
        .padding()
        .onAppear {
            Task {
                let url: URL = URL(string: pieceSaver.artPieces[0].imageURL!)!
                do {
                    self.image = try await pieceSaver.fetchImage(url: url)
                    self.isShowingImage = true
                } catch {
                    throw(error)
                }
            }
        }
        .onChange(of: counter) { _ in
            Task {
                image = UIImage()
                self.isShowingImage = false
                var url: URL = URL(string: pieceSaver.artPieces[counter].imageURL!)!
                do {
                    self.image = try await pieceSaver.fetchImage(url: url)
                    self.isShowingImage = true
                } catch {
                    throw(error)
                }
            }
        }
    }
}
