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
    @State var nextLine: Bool = false
    
    let finalText: String = "IsSo FeFe MaThiNa Mas vamos mais longe com essa frase toda aqui imensa tentando pegar mais coisas na tela aaaaa  aa a  a ldajldkajs aklnd"
    @State var text: String = ""
    
    var body: some View {
        HStack {
            Text(text)
                .multilineTextAlignment(.leading)
                .onAppear(perform: {
                    typeWriter()
                })
            Spacer()
        }.padding(.leading, 16)
    }
    
    
    func typeWriter(at position: Int = 0) {
        if position % 40 == 39 {
            nextLine = true
        }
        if position < finalText.count {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.07) {
                let character = finalText[position]
                
                if character == " " && nextLine {
                    text = ""
                } else {
                    nextLine = false
                    text.append(finalText[position])
                }
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
