//
//  ContentView.swift
//  NextButton
//
//  Created by Николай Игнатов on 05.10.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var isAnimate: Bool = false
    @Namespace private var namespaceID
    
    var body: some View {
        Button {
            withAnimation(.interpolatingSpring(mass: 1, stiffness: 100, damping: 10, initialVelocity: 0)) {
                isAnimate.toggle()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    isAnimate.toggle()
                }
            }
        } label: {
            HStack {
                Image(systemName: "play.fill")
                    .font(.largeTitle)
                    .scaleEffect(isAnimate ? 1 : 0)
                    .opacity(isAnimate ? 1 : 0.5)
                    .offset(x: isAnimate ? 40 : 20)
                    .matchedGeometryEffect(id: "id", in: namespaceID, isSource: true)
                
                Image(systemName: "play.fill")
                    .font(.largeTitle)
                    .offset(x: isAnimate ? 65 : 40)
                    .matchedGeometryEffect(id: "id", in: namespaceID, isSource: false)
                
                Image(systemName: "play.fill")
                    .font(.largeTitle)
                    .scaleEffect(isAnimate ? 0 : 1)
                    .offset(x: isAnimate ? 90 : 65)
                    .opacity(isAnimate ? 0.0 : 1)
                    .matchedGeometryEffect(id: "id", in: namespaceID, isSource: false)
            }
        }
    }
}

#Preview {
    ContentView()
}
