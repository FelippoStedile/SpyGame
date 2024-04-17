//
//  BombViewModel.swift
//  Spy770
//
//  Created by Felipe  Elsner Silva on 17/04/24.
//

import SwiftUI

final class TimerViewModel: ObservableObject {
    @Published var time: String = Constants.shared.timerCount
    @Published var minutes: Float = Constants.shared.timerValue {
        didSet {
            self.time = "\(Int (minutes)):00"
        }
    }
    
    private var initialTime = 0
    private var endDate = Date()
    
    func start(minutes: Float) {
        if minutes == Constants.shared.timerValue {
            self.initialTime = Int(minutes)
        }
        
        self.endDate = Date()
        self.endDate = Calendar.current.date(byAdding: .second, value: Int(minutes*60 + Float(time.suffix(2))!), to: endDate)!
    }
    
    func updateCountdown() {
        let now = Date()
        let diff = endDate.timeIntervalSince1970 - now.timeIntervalSince1970
        
        if diff <= 0 {
            self.time = Constants.shared.timerCount
            self.minutes = Constants.shared.timerValue
            return
        }
        
        let date = Date(timeIntervalSince1970: diff)
        let calendar = Calendar.current
        let minutes = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)
        self.minutes = Float (minutes)
        self.time = String(format: "%02d:%02d", minutes, seconds)
    }
}
