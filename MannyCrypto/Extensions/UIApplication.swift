//
//  UIApplication.swift
//  MannyCrypto
//
//  Created by Manuel Alvarez on 02/08/2025.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
