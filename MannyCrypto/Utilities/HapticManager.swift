//
//  HapticManager.swift
//  MannyCrypto
//
//  Created by Manuel Alvarez on 03/08/2025.
//
import Foundation
import SwiftUI

class HapticManager {
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
