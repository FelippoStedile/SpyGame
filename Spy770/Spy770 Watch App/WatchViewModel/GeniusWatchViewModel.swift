//
//  GeniusWatchViewModel.swift
//  Spy770 Watch App
//
//  Created by Felippo Stedile on 17/04/24.
//

import Foundation

class GeniusWatchViewModel: ObservableObject {
    
    @Published var sequenceTapped: [Int] = []
    
    func addTap(button: Int) {
        sequenceTapped.append(button)
        if sequenceTapped.count == 6 {
            //sendAlgo
            sequenceTapped = []
        }
    }
}
