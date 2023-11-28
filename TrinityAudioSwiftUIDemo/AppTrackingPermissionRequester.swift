//
//  AppTrackingPermissionRequester.swift
//  TrinityAudioSwiftUIDemo
//
//  Created by Kenji Hung Pham on 28/11/2023.
//

import Foundation
import AppTrackingTransparency

class AppTrackingPermissionRequester: ObservableObject {
    @Published var isRequestedTrackingPermission = false
    
    func request() {
        guard isRequestedTrackingPermission == false else {
            return
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            ATTrackingManager.requestTrackingAuthorization { [weak self]  status in
                switch status {
                case .authorized:
                    print("enable tracking")
                case .denied:
                    print("disable tracking")
                default:
                    print("notDetermined or restricted tracking")
                }
                DispatchQueue.main.async {
                    self?.isRequestedTrackingPermission = true
                }
            }
        })
    }
}
