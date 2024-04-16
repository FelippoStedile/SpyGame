//
//  File.swift
//  Spy770
//
//  Created by Nathan Baptista Schostack on 16/04/24.
//

import SwiftUI
import ARKit

struct ARView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> ARViewController {
        return ARViewController()
    }
    
    func updateUIViewController(_ uiViewController: ARViewController, context: Context) {}
    
}
