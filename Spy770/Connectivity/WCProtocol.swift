//
//  WCProtocol.swift
//  Spy770
//
//  Created by Thiago Parisotto on 16/04/24.
//

import Foundation
import WatchConnectivity

protocol WCProtocol {
    var session: WCSession? { get }
    func startSession()
    func onReceiveMessage<T:Decodable>(_ message: [String : Any], key: String, ofType: T.Type, completion: @escaping (T) -> Void)
    func sendMessage<T: Encodable>(key: String, value: T)
}
