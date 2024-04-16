//
//  ConnectivityViewModel.swift
//  Spy770
//
//  Created by Thiago Parisotto on 16/04/24.
//

import Foundation
import WatchConnectivity

class ConnectivityViewModel: NSObject, ObservableObject {
    @Published var password: [Int] = []
}


//MARK: - functions
extension ConnectivityViewModel {
    func generatePassword() -> [Int] {
        return [Int(arc4random_uniform(100)), Int(arc4random_uniform(100)), Int(arc4random_uniform(100))]
    }
}
