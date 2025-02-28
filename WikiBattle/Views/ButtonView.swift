//
//  ButtonView.swift
//  WikiBattle
//  


import SwiftUI

struct ButtonView: View {
    
    let buttonType: ButtonType
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(buttonType.label)
                .frame(width:buttonType.width, height: buttonType.height)
                .foregroundStyle(Color(.label))
                .fontWeight(.bold)
                .background(buttonType.color)
                .clipShape(Capsule())
        }

    }
}

#Preview {
    ButtonView(buttonType: .next) {
        print("Pushed Button")
    }
}
