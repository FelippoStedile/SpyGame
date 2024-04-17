//
//  GeniusView.swift
//  Spy770
//
//  Created by Felippo Stedile on 17/04/24.
//

import SwiftUI

struct GeniusView: View {
    @StateObject var geniusVM: GeniusViewModel = GeniusViewModel()
    
    var body: some View {
        Circle().foregroundStyle(geniusVM.currentColor)
        .onAppear(){
            geniusVM.changeColor()
        }
    }
    
    
}

#Preview {
    GeniusView()
}
