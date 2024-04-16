//
//  SharedConnectivityViewModel+WCProtocol.swift
//  Spy770
//
//  Created by Thiago Parisotto on 16/04/24.
//

import Foundation
import WatchConnectivity

extension SharedConnectivityViewModel: WCProtocol {
    var session: WCSession? {
        WCSession.isSupported() ? WCSession.default : nil
    }
    
    func startSession() {
        self.session?.delegate = self
        session?.activate()
    }
    
    func onReceiveMessage<T:Decodable>(_ message: [String : Any], key: String, ofType: T.Type, completion: @escaping (T) -> Void) {
        DispatchQueue.main.async {
            if let receivedValue = message[key] as? Data,
               let decodedValue = try? JSONDecoder().decode(T.self, from: receivedValue) {
                completion(decodedValue)
            }
        }
    }
    
    func sendMessage<T: Encodable>(key: String, value: T) {
        if let data = try? JSONEncoder().encode(value) {
            session?.sendMessage([key: data], replyHandler: nil) { error in
                print(error.localizedDescription)
            }
        }
    }
}
