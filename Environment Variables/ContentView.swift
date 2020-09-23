//
//  ContentView.swift
//  Environment Variables
//
//  Created by Stewart Lynch on 2020-09-19.
//

import SwiftUI

struct ContentView: View {
    @State private var showModal = false
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.layoutDirection) var layoutDirection
    @Environment(\.locale) var locale
    @Environment(\.calendar) var calendar
    var body: some View {
        NavigationView {
            VStack {
                Text(String(describing: horizontalSizeClass))
                Text(String(describing: colorScheme))
                Text(String(describing: layoutDirection))
                Text(String(describing: locale))
                Text(String(describing: calendar.firstWeekday))
                if horizontalSizeClass == .compact {
                    VStack {
                        ColoredRectangle(color: UIColor(named: "DarkCTGreen")!)
                        ColoredRectangle(color: UIColor(named: "LightCTGreen")!)
                    }
                } else {
                    HStack {
                        ColoredRectangle(color: UIColor(named: "DarkCTGreen")!)
                        ColoredRectangle(color: UIColor(named: "LightCTGreen")!)
                    }
                }
                
            }
            .navigationTitle("Environment Variables")
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button(action: {
                        showModal = true
                    }) {
                        Text("Show Modal")
                    }
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
        .fullScreenCover(isPresented: $showModal) {
            ModalView()
                .preferredColorScheme(colorScheme == .light ? .dark : .light)
//                .environment(\.colorScheme, colorScheme == .light ? .dark : .light)
        }
    }
}

struct ColoredRectangle:  View {
    var color: UIColor
    var body: some View {
        Rectangle()
            .foregroundColor(Color(color))
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
