//
//  CustomListRowView.swift
//  Hike
//
//  Created by Jigar Oza on 17/08/24.
//

import SwiftUI

struct CustomListRowView: View {
    // MARK: - Properties
    @State var label: String
    @State var icon: String
    @State var content: String? = nil
    @State var tintColor: Color
    @State var linkLabel: String? = nil
    @State var linkDestination: String? = nil
    
    var body: some View {
        LabeledContent {
            // Content
            if content != nil {
                Text(content!)
                    .fontWeight(.heavy)
                    .foregroundStyle(.primary)
            } else if linkLabel != nil && linkDestination != nil {
                Link(linkLabel!, destination: URL(string: linkDestination!)!)
                    .fontWeight(.heavy)
                    .foregroundStyle(.pink)
            }
        } label: {
            // Label
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundStyle(tintColor)
                    Image(systemName: icon)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                }
                Text(label)
            }
        }
    }
}

#Preview {
    List {
        CustomListRowView(
            label: "Designer",
            icon: "pinkpalette",
            content: "John Doe",
            tintColor: .blue
        )
    }
}
