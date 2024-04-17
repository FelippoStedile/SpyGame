//
//  Timer.swift
//  Spy770
//
//  Created by Felipe  Elsner Silva on 17/04/24.
//

import SwiftUI

struct Timer {
    @Published var time: String = Constants.shared.timerCount
    @Published var minutes: Float = Constants.shared.timerValue {
        didSet {
            self.time = "\(Int (minutes)):00"
        }
    }
    
    private var initialTime = 0
    private var endDate = Date()
    
    
}
