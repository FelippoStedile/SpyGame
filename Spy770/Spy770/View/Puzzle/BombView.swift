//
//  BombView.swift
//  Spy770
//
//  Created by Felippo Stedile on 15/04/24.
//

import SwiftUI

struct BombView: View {
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    
    @StateObject var timerVM = TimerViewModel()
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var password = ""
    let numberButtons = [["7", "8", "9"], ["4", "5", "6"], ["1", "2", "3"], ["0"]]
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 5)
                    .frame(width: 300, height: 90)
                    .foregroundStyle(.gray)
                Text("\(timerVM.time)")
                    .foregroundStyle(.white)
                    .onReceive(timer) { _ in
                        timerVM.updateCountdown()
                    }
            }
            VStack {
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 190, height: 45)
                        .foregroundStyle(.gray)
                    Text(password)
                        .foregroundStyle(.white)
                }
                ForEach(0..<numberButtons.count) { i in
                    HStack {
                        ForEach(0..<numberButtons[i].count) { j in
                            Button {
                                if password.count < 4 {
                                    password = password + numberButtons[i][j]
                                }
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 42, height: 42)
                                        .foregroundStyle(.gray)
                                    Text(numberButtons[i][j])
                                        .foregroundStyle(.white)
                                }
                            }

                        }
                    }
                }
                Button {
                    if password.count == 4 {
                        password = ""
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: 160, height: 40)
                            .foregroundStyle(.green)
                        Text("Enter")
                            .foregroundStyle(.white)
                    }
                }

            }
        }
        .padding(.vertical, 20)
        .padding(.horizontal, 100)
        .background(.black)
        .onAppear(perform: {
            timerVM.start(minutes: timerVM.minutes)
            AppDelegate.orientationLock = .landscapeRight
        })
        .onChange(of: horizontalSizeClass) {
            AppDelegate.orientationLock = .landscapeRight
        }
    }
}

#Preview {
    BombView()
}
