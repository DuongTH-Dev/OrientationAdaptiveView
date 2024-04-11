//
//  ContentView.swift
//  OrientationSample
//
//  Created by DuongTo on 11/4/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        OrientationAdaptiveView {
            Text("Potrait Screen")
            VStack(content: {
                Text("Top")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.red)
                Text("Bottom")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.green)

            })
        } landspaceContent: {
            Text("Landspace Screen")
            HStack(content: {
                Text("Left")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.blue)

                Text("Right")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.purple)

            })
        }
    }
}

#Preview {
    ContentView()
}
