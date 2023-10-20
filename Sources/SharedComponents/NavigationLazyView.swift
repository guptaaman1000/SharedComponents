//
//  NavigationLazyView.swift
//
//
//  Created by Aman Gupta on 20/10/23.
//

import SwiftUI

public struct NavigationLazyView<Content: View>: View {
    
    private let build: () -> Content
    
    public init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    
    public var body: Content {
        build()
    }
}

#Preview {
    NavigationLazyView(Text("Hello World"))
}
