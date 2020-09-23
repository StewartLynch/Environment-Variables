//
//  ModalView.swift
//  Environment Variables
//
//  Created by Stewart Lynch on 2020-09-19.
//

import SwiftUI

struct ModalView: View {
    @Environment(\.sizeCategory) var sizeCategory
    @Environment(\.presentationMode) var presentationMode
    @State private var currentSize: Int = 0
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                VStack {
                    Text("This is some Text").font(.title)
                    Text("Current Size is \(String(describing: ContentSizeCategory.allCases[currentSize]))")
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum")
                }.environment(\.sizeCategory, ContentSizeCategory.allCases[currentSize])
                .padding()
                HStack(spacing: 20) {
                    Button(action: {
                        // Need Code here to decrease size
                        if currentSize > 0 {
                            currentSize -= 1
                        }
                        
                    }) {
                        Image(systemName: "minus.magnifyingglass")
                            .padding(5)
                            .background(Color.accentColor)
                            .foregroundColor(Color(UIColor.systemBackground))
                            .cornerRadius(8)
                    }
                    Button(action: {
                        // Need Code here to increase size
                        if currentSize < ContentSizeCategory.allCases.count - 1 {
                            currentSize += 1
                        }
                    }) {
                        Image(systemName: "plus.magnifyingglass")
                            .padding(5)
                            .background(Color.accentColor)
                            .foregroundColor(Color(UIColor.systemBackground))
                            .cornerRadius(8)
                    }
                }
            }
                .navigationTitle("Modal Screen")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .automatic) {
                        Button(action: {
                            // Need Code here to dismiss modal sheet
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .font(.title)
                                .frame(width: 40, height: 40)
                        }
                    }
                }
        }.onAppear {
            currentSize = ContentSizeCategory.allCases.firstIndex{$0 == sizeCategory}!
        }
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
    }
}
