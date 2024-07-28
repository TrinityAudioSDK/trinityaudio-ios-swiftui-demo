//
//  TrinityPlayerDelegate.swift
//  TrinityAudioSwiftUIDemo
//
//  Created by Kenji Hung Pham on 28/11/2023.
//

import Foundation
import TrinityPlayer


class TrinityPlayerDelegate: ObservableObject, TrinityAudioDelegate {

    private var cachedEvents = [[String: Any]]()
    @Published var eventLog : String = ""
    
    func trinity(service: TrinityAudioProtocol, receiveError: TrinityError) {
        print(receiveError)
    }
    
    func trinity(service: TrinityAudioProtocol, detectUpdateForContentHeight height: Float, inState state: TrinityState) {
        print(state)
    }
    
    func trinity(service: TrinityAudioProtocol, didCheckCookie cookieData: [String : Any]) {
        print(cookieData)
    }
    
    func trinity(service: TrinityPlayer.TrinityAudioProtocol, didReceivePostMessage message: [String : Any]) {
        print(message)
        eventLog.append("\n\(message)")
    }
    
    func trinity(service: any TrinityPlayer.TrinityAudioProtocol, onPlayerReady playerId: String) {
        print("onPlayerReady \(playerId)")
    }
}
