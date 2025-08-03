//
//  XMarkButton.swift
//  MannyCrypto
//
//  Created by Manuel Alvarez on 03/08/2025.
//

import SwiftUI

struct XMarkButton: View {
    let action: () -> Void
    
    init(action: @escaping () -> Void = {}) {
        self.action = action
    }
    
    var body: some View {
        Button(action: action, label: {
            Image(systemName: "xmark")
                .font(.headline)
                .foregroundStyle(Color.theme.myAccent)
        })
    }
}

#Preview {
    XMarkButton()
}
