//
//  BedroomView.swift
//  projectroom
//
//  Created by Emanuele Bazzicalupo on 04/03/25.
//

import SwiftUI

struct MetroView: View {
    
    @Binding var screen: ContentView.Screen
    
    @State var dialogueNumber = 0
    @State var itemClicked = 0
    @State var counterClicked = 5
    
    @State private var isAnimatingText = false
    
    let dialogues = [
        "1",
        "2",
        "3",
        "4",
        "5",
        "6",
        "7",
        "8",
        "9",
        "10"
    ]
    
    let itemsThinking = [
        //0 = Start
        "Let me check around...",
        //1 = Handle
        "Should I hold on? No, better not-I mean, what if the train brakes suddenly? Okay, I'll hold on.",
        //2 = Window
        "I look at the reflection. I look tired. Or maybe just nervous?",
        //3 = Billboard
        "Advertising on glasses? I might actually need them.",
        //4 = Floor
        "Why would I look at the floor, to avoid stares?",
        //5 = Next Stop
        "Just a few more. Come on, I'm almost there."
    ]
    
    @State var disappearItemClickable = [1, 1, 1, 1, 1]
    
    var body: some View {
        ZStack {
            Rectangle()
                .hidden()
            
            if dialogueNumber == 29 {
                ZStack {
                    if disappearItemClickable[0] == 1 {
                        Button {
                            itemClicked = 1
                            counterClicked -= 1
                            disappearItemClickable[0] = 0
                        } label: {
                            Rectangle()
                                .fill(Color.white)
                                .scaledToFit()
                                .frame(width: 100)
                                .mask {
                                    Image(systemName: "questionmark.bubble")
                                }
                        }
                        .offset(x: -240, y: -70)
                        .opacity(!isAnimatingText || itemClicked == 1 ? 1 : 0.7)
                        .disabled(isAnimatingText)
                    }
                    
                    if disappearItemClickable[1] == 1 {
                        Button {
                            itemClicked = 2
                            counterClicked -= 1
                            disappearItemClickable[1] = 0
                        } label: {
                            Rectangle()
                                .fill(Color.black)
                                .scaledToFit()
                                .frame(width: 80)
                                .mask {
                                    Image(systemName: "questionmark.bubble")
                                }
                                .offset(x: 15, y: -10)
                        }
                        .offset(x: -200, y: 5)
                        .opacity(!isAnimatingText || itemClicked == 2 ? 1 : 0.7)
                        .disabled(isAnimatingText)
                    }
                    
                    if disappearItemClickable[2] == 1 {
                        Button {
                            itemClicked = 3
                            counterClicked -= 1
                            disappearItemClickable[2] = 0
                        } label: {
                            Rectangle()
                                .fill(Color.white)
                                .frame(width: 250, height: 230)
                                .mask {
                                    Image(systemName: "questionmark.bubble")
                                }
                                .offset(x: -5, y: -10)
                        }
                        .offset(x: 80, y: -45)
                        .opacity(!isAnimatingText || itemClicked == 3 ? 1 : 0.7)
                        .disabled(isAnimatingText)
                    }
                        
                    if disappearItemClickable[3] == 1 {
                        Button {
                            itemClicked = 4
                            counterClicked -= 1
                            disappearItemClickable[3] = 0
                        } label: {
                            Rectangle()
                                .fill(Color.white)
                                .frame(width: 70, height: 140)
                                .mask {
                                    Image(systemName: "questionmark.bubble")
                                }
                        }
                        .offset(x: 260, y: -75)
                        .opacity(!isAnimatingText || itemClicked == 4 ? 1 : 0.7)
                        .disabled(isAnimatingText)
                    }
                    
                    if disappearItemClickable[4] == 1 {
                        Button {
                            itemClicked = 5
                            counterClicked -= 1
                            disappearItemClickable[4] = 0
                        } label: {
                            Rectangle()
                                .fill(Color.white)
                                .scaledToFit()
                                .frame(width: 50)
                                .mask {
                                    Image(systemName: "questionmark.bubble")
                                }
                        }
                        .offset(x: -340, y: 145)
                        .opacity(!isAnimatingText || itemClicked == 5 ? 1 : 0.7)
                        .disabled(isAnimatingText)
                    }
                }
            }
        }
        .background(
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                
                Image("Metro")
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fill)
                    .onTapGesture {
                        if dialogueNumber == 30 {
                            screen = .ciao
                        } else if counterClicked == 0 {
                            dialogueNumber = 30
                        } else if isAnimatingText == false && dialogueNumber != 29 {
                            dialogueNumber += 1
                        }
                    }
                
                if dialogueNumber == 29 {
                    TypewriterTextView(text: itemsThinking[itemClicked]) {
                        isAnimatingText = true
                    } onEndedAnimation: {
                        isAnimatingText = false
                    }
                } else {
                    TypewriterTextView(text: dialogues[dialogueNumber]) {
                        isAnimatingText = true
                    } onEndedAnimation: {
                        isAnimatingText = false
                    }
                }
            }
        )
    }
}

#Preview {
    MetroView(screen: .constant(.metro))
}
