//
//  HomeView.swift
//  Spy770 Watch App
//
//  Created by Felippo Stedile on 15/04/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var vm: SharedConnectivityViewModel
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Button("teste") {
            vm.updateView(view: .credits)
        }
    }
}

#Preview {
    HomeView()
}
