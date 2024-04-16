//
//  TypewriterView.swift
//  Spy770
//
//  Created by Felippo Stedile on 16/04/24.
//

import SwiftUI

extension String {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

struct TypewriterView: View {
    var nextLine: Bool = false
    
    let finalText: String = "IsSo FeFe MaThiNa Mas vamos mais longe com essa frase toda aqui imensa tentando pegar mais coisas na tela"
    @State var text: String = ""
    
    var body: some View {
        Text(text)
            .onAppear(perform: {
                typeWriter()
            })
    }
    
    
    func typeWriter(at position: Int = 0) {
        if position % 60 == 40 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                text = ""
            }
        }
        if position < finalText.count {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.07) {
                text.append(finalText[position])
                typeWriter(at: position + 1)
            }
        }
    }
}

#Preview {
    NavigationStack{
        NavigationLink {
            TypewriterView()
        } label: {
            ButtonView()
        }
    }
}
