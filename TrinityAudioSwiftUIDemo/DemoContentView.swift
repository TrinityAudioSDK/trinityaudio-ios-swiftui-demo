//
//  DemoContentView.swift
//  TrinityAudioSwiftUIDemo
//
//  Created by Kẹni Hung Pham on 28/11/2023.
//

import SwiftUI
import TrinityPlayer

struct DemoContentView: View {

    @StateObject var trinityAudioController = TrinityAudioController(unitId: "2900004156", contentURL:"https://demo.trinityaudio.ai/general-demo/demo.html")
    @StateObject var delegate = TrinityPlayerDelegate()
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: 20) {
                Text("Artificial Intelligence Is Too Important to Leave to Google and Facebook Alone")
                    .font(.system(size: 29, weight: .heavy))
                    .foregroundColor(.black)
                Text("Let’s develop a public research consortium to take on useful projects that have no commercial prospects.")
                    .font(.system(size: 21))
                    .foregroundColor(Color(UIColor.darkGray))
                VStack(alignment: .leading) {
                    Image("articleImg", bundle: Bundle.main)
                        .resizable()
                        .scaledToFill()
                    Text("A Deep Blue Technology self-driving bus at the World Artificial Intelligence Conference in Shanghai last May.")
                        .font(.system(size: 14))
                }
                .foregroundColor(Color(UIColor.lightGray))
                // 1. Insert the player view on the scroll view
                TrinityAudioPlayer(audioController: trinityAudioController)
                VStack(alignment: .leading) {
                    Text("Player Events")
                        .font(.system(size: 21, weight: .heavy))
                    ScrollView {
                        Text(delegate.eventLog)
                            .font(.system(size: 12))
                    }.frame(height: 200)
                }
                Text(AppContent.shared.article)
                    .font(.system(size: 14))
                    .foregroundColor(Color(UIColor.lightGray))
            }
        }
        .padding()
        // 2. Must observe the scrollable view to detect the FAB state
        .trinityObserveScrollViewContentSize(controller: trinityAudioController)
        // 3. Attach the FAB to any root view that you want
        .trinityFAB(
            controller: trinityAudioController,
            fabViewTopLeftCoordinates: CGPoint(x: 20, y: 80)
        ).onAppear(perform: {
            trinityAudioController.delegate = delegate
        })
    }
}

struct DemoContentView_Previews: PreviewProvider {
    static var previews: some View {
        DemoContentView()
    }
}

