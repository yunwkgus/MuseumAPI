//
//  ContentView.swift
//  MuseumAPI
//
//  Created by jose Yun on 11/11/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var pieceSaver: PieceSaver
    @State var receiveChange: Bool = false
    var body: some View {
        VStack {
            if !receiveChange {
                ProgressView()
            } else {
                ArtPieceView()
            }
        }
        .onReceive( pieceSaver.fetchSuccess, perform: { receiveChange = true }
        )
        .task {
            do {
                try await pieceSaver.fetchArtFromAPI()
            } catch {
                print(error)
            }
        }
    }
}

#Preview {
    ContentView()
}
