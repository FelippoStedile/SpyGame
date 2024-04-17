//
//  GeniusView.swift
//  Spy770 Watch App
//
//  Created by Felippo Stedile on 17/04/24.
//

import SwiftUI

struct GeniusWatchView: View {
    @StateObject var geniusWatchVM: GeniusWatchViewModel = GeniusWatchViewModel()
    
    var body: some View {
        VStack(spacing: 0){
            HStack(spacing: 0) {
                Button(action: {
                    geniusWatchVM.addTap(button: 0)
                    print(geniusWatchVM.sequenceTapped)
                }, label: {
                    RoundedRectangle(cornerRadius: 10).foregroundStyle(.yellow)
                })
                
                Button(action: {
                    geniusWatchVM.addTap(button: 1)
                    print(geniusWatchVM.sequenceTapped)
                }, label: {
                    RoundedRectangle(cornerRadius: 10).foregroundStyle(.blue)
                })
            }
            HStack(spacing: 0){
                Button(action: {
                    geniusWatchVM.addTap(button: 2)
                    print(geniusWatchVM.sequenceTapped)
                }, label: {
                    RoundedRectangle(cornerRadius: 10).foregroundStyle(.green)
                })
                
                Button(action: {
                    geniusWatchVM.addTap(button: 3)
                    print(geniusWatchVM.sequenceTapped)
                }, label: {
                    RoundedRectangle(cornerRadius: 10).foregroundStyle(.red)
                })
            }
        }.ignoresSafeArea()
    }
}

#Preview {
    GeniusWatchView()
}
