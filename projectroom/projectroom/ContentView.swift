//
//  ContentView.swift
//  projectroom
//
//  Created by Emanuele Bazzicalupo on 04/03/25.
//

import SwiftUI
import UIKit

struct ContentView: View {
    enum Screen {
        case start, bedroom, metro, ciao
    }
    
    @State private var currentScreen = Screen.start
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            switch currentScreen {
            case .start:
                VStack(alignment: .center) {
                    Text("Roomy Journey")
                        .font(.custom("Silkscreen-Bold", size: 30))
                        .foregroundColor(.white)
                        .bold()
                        .padding()
                    
                    Button {
                        currentScreen = .bedroom
                    } label: {
                        Text("Start")
                            .font(.custom("Silkscreen-Regular", size: 20))
                            .foregroundColor(.red)
                    }
                    .padding()
                    
                    Text("TUTORIAL\nTap on screen = Next Dialogue\nTap on text = Complete Phrase")
                        .font(.custom("Silkscreen-Regular", size: 14))
                        .foregroundColor(.white)
                }
                .transition(.opacity.combined(with: .blurReplace))
            case .bedroom:
                BedroomView(screen: $currentScreen)
                    .transition(.opacity.combined(with: .blurReplace))
            case .metro:
                MetroView(screen: $currentScreen)
                    .transition(.opacity.combined(with: .blurReplace))
            case .ciao:
                CiaoView()
                    .transition(.opacity.combined(with: .blurReplace))
            }
            
        }
        .animation(.default, value: currentScreen)
    }
}

#Preview {
    ContentView()
}
