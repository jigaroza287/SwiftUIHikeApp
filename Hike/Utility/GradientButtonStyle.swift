//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by Jigar Oza on 08/08/24.
//

import Foundation
import SwiftUI

struct GradientButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        let colorArray = configuration.isPressed ? [Color.customGrayMedium, Color.customGrayLight] : [Color.customGrayLight, Color.customGrayMedium]
        configuration
            .label
            .padding()
            .background(
                LinearGradient(colors: colorArray, startPoint: .top, endPoint: .bottom)
            )
            .cornerRadius(40)

    }
}
