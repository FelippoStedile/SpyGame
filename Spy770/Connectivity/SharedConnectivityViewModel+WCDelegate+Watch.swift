//
//  SharedConnectivityViewModel+WCDelegate+Watch.swift
//  Spy770 Watch App
//
//  Created by Thiago Parisotto on 16/04/24.
//

import Foundation
import WatchConnectivity

extension SharedConnectivityViewModel: WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: (any Error)?) {
        
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        self.onReceiveMessage(message, key: "password", ofType: [Int].self) { password in
            self.password = password
        }
    }
}
