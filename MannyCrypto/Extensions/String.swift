//
//  String.swift
//  MannyCrypto
//
//  Created by Manuel Alvarez on 03/08/2025.
//

import Foundation

extension String {
    
    
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
    
}
