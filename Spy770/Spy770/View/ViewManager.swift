//
//  ViewManager.swift
//  Spy770 Watch App
//
//  Created by Thiago Parisotto on 17/04/24.
//

import SwiftUI

struct ViewManager: View {
    @EnvironmentObject var vm: SharedConnectivityViewModel
    var body: some View {
        switch vm.currentView {
        case .home:
            HomeView()
                .environmentObject(vm)
        case .credits:
            CreditsView()
        case .settings:
            HomeView()
        case .intro:
            IntroVideoView()
        case .augmentedReality:
            ARView()
        case .hack:
            HackView()
        case .bomb:
            BombView()
        case .sucess:
            SuccessView()
        case .fail:
            FailView()
        }
        
    }
}

#Preview {
    ViewManager()
}
