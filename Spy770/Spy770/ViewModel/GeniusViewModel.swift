//
//  GeniusViewModel.swift
//  Spy770
//
//  Created by Felippo Stedile on 17/04/24.
//

import SwiftUI

class GeniusViewModel: ObservableObject{
    
    @Published var answer: [Int] = []
    private var colorSeq: [Color] = []
    @Published var currentColor: Color = .white
    
    init() {
        self.colorSeq = randColor()
    }
    
    func randColor() -> [Color] {
        var createColor: [Color] = []
        let possibleColors: [Color] = [.yellow, .blue, .green, .red]
        
        for _ in 0..<6{
            let randomInt: Int = .random(in: 0..<4)
            self.answer.append(randomInt)
            createColor.append(possibleColors[randomInt])
            createColor.append(.white)
        }
        for _ in 0..<18 {
            createColor.append(.white)
        }
        
       return createColor
    }
    
    func changeColor(){
        var i = 0
        Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true){_ in
            self.currentColor = self.colorSeq[i]
            i+=1
            i = i%23
        }
    }
    
}
