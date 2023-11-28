//
//  TrinityPlayerDelegate.swift
//  TrinityAudioSwiftUIDemo
//
//  Created by Ryan Hung Pham on 28/11/2023.
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
        
        cachedEvents.append(message)
        
        if let eventsData = try? JSONSerialization.data(withJSONObject: cachedEvents, options: [.prettyPrinted, .withoutEscapingSlashes]),
           let eventsText = String(data: eventsData, encoding: .utf8) {
            eventLog = eventsText
        }
    }
}
