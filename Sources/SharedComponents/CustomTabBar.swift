//
//  CustomTabBar.swift
//  MovieApp
//
//  Created by Aman Gupta on 16/10/23.
//

import SwiftUI

public struct CustomTabBar: View {
    
    @Binding private var selectedTab: Int
    private let tab1: String
    private let tab2: String
    
    public init(selectedTab: Binding<Int>, tab1: String, tab2: String) {
        self._selectedTab = selectedTab
        self.tab1 = tab1
        self.tab2 = tab2
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                CustomButton(title: tab1, index: 0, selectedTab: $selectedTab)
                CustomButton(title: tab2, index: 1, selectedTab: $selectedTab)
            }
            .background(Color.black)
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.white)
        }
    }
}

struct CustomButton: View {
    
    var title: String
    let index: Int
    @Binding var selectedTab: Int
    
    var body: some View {
        Button {
            withAnimation {
                selectedTab = index
            }
        } label: {
            VStack {
                Text(title)
                    .foregroundColor(selectedTab == index ? .white : .gray)
                Rectangle()
                    .frame(height: 2)
                    .foregroundColor(selectedTab == index ? .white : .clear)
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedTab: .constant(0), tab1: "Now Playing", tab2: "Favourite")
    }
}
