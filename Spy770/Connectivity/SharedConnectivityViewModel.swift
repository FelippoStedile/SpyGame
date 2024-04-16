//
//  ConnectivityViewModel.swift
//  Spy770
//
//  Created by Thiago Parisotto on 16/04/24.
//

import Foundation
import WatchConnectivity

enum ViewName: String, Codable {
    case home
    case credits
    case settings
    case intro
    case augmentedReality
    case hack
    case bomb
    case sucess
    case fail
}
class SharedConnectivityViewModel: NSObject, ObservableObject {
    @Published var password: [Int] = []
    @Published var currentView: ViewName = .home
}


//MARK: - functions
extension SharedConnectivityViewModel {
    func generatePassword() -> [Int] {
        return [Int(arc4random_uniform(100)), Int(arc4random_uniform(100)), Int(arc4random_uniform(100))]
    }
    func updatePassword() {
        sendMessage(key: "password", value: password)
    }
    func updateView(view: ViewName) {
        sendMessage(key: "viewName", value: view)
    }

}
