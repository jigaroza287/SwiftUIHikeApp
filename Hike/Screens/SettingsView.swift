//
//  SettingsView.swift
//  Hike
//
//  Created by Jigar Oza on 16/08/24.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - Properties
    
    private let alternateAppIcons: [String] = [
        "AppIcon-Backpack",
        "AppIcon-Camera",
        "AppIcon-Campfire",
        "AppIcon-MagnifyingGlass",
        "AppIcon-Map",
        "AppIcon-Mushroom",
    ]
    
    var body: some View {
        List {
            // MARK: - Header
            Section {
                HStack {
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 60, weight: .black))
                    VStack(spacing: -10) {
                        Text("Hike")
                            .font(.system(size: 60, weight: .black))
                        Text("Editor's Choice")
                            .fontWeight(.medium)
                    }
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 60, weight: .black))
                    Spacer()
                }
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            .customGreenLight,
                            .customGreenMedium,
                            .customGreenDark
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .padding(.top, 8)
                
                VStack(spacing: 8) {
                    Text("Where can you find \nperfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    Text("The hike which looks gorgeous in photos is even better once you are actually there. The hike that you hope to do again someday. \nFind the best day hikes in the app.")
                        .font(.footnote)
                        .italic()
                    Text("Dust off the boots! It's time for a walk.")
                        .fontWeight(.heavy)
                        .foregroundStyle(Color.customGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
            } //: Header
            .listRowSeparator(.hidden)
            // MARK: - Icons
            
            Section {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(alternateAppIcons.indices, id: \.self) { item in
                            Button {
                                // Action
                                UIApplication.shared.setAlternateIconName(alternateAppIcons[item]) { error in
                                    if error != nil {
                                        print("Setting app icon failed, Reason: \(String(describing: error?.localizedDescription))")
                                    } else {
                                        print("Setting app icon succeeded")
                                    }
                                }
                            } label: {
                                Image("\(alternateAppIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                            }
                        }
                    }
                }//: ScrollView
                .padding(.top, 12)
                
                Text("Choose your favourite icon from the collection above.")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .font(.footnote)
                    .padding(.bottom, 12)
            } header: {
                Text("Alternate Icons")
            }
            .listRowSeparator(.hidden)
            
            // MARK: - About
            
            Section (
                content: {
                    CustomListRowView(label: "Application", icon: "apps.iphone", content: "Hike", tintColor: .blue)
                    CustomListRowView(label: "Compatibility", icon: "info.circle", content: "iOS, iPadOS", tintColor: .red)
                    CustomListRowView(label: "Technology", icon: "swift", content: "Swift", tintColor: .orange)
                    CustomListRowView(label: "Version", icon: "gear", content: "1.0", tintColor: .purple)
                    CustomListRowView(label: "Developer", icon: "ellipsis.curlybraces", content: "John Doe", tintColor: .mint)
                    CustomListRowView(label: "Designer", icon: "paintpalette", content: "M F Hussain", tintColor: .pink)
                    CustomListRowView(label: "Website", icon: "globe", tintColor: .indigo, linkLabel: "Google", linkDestination: "https://www.google.com")
                }, header: {
                    Text("ABOUT THE APP")
                }, footer: {
                    HStack {
                        Spacer()
                        Text("Copyright © All rights reserved.")
                        Spacer()
                    }
                    .padding(.vertical, 8)
                }
            )
        } //: List
    }
}

#Preview {
    SettingsView()
}
