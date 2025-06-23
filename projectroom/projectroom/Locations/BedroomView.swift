//
//  BedroomView.swift
//  projectroom
//
//  Created by Emanuele Bazzicalupo on 04/03/25.
//

import SwiftUI

struct BedroomView: View {
    
    @Binding var screen: ContentView.Screen
    
    @State var dialogueNumber = 0
    @State var steveReaction = "Steve_Neutral"
    @State var itemClicked = 0
    @State var counterClicked = 9
    @State var soundButton = true
    
    @State private var isAnimatingText = false
    
    let dialogues = [
        NSLocalizedString("Well now I'm forced to actually go, by now I've promised... Haven't I?", comment: ""),
        NSLocalizedString("...What if I... make up some other excuse?", comment: ""),
        NSLocalizedString("Or I could use the usual “Steve” tactic, it's practically patented now.", comment: ""),
        NSLocalizedString("...Then again, what would it cost me? I could simply disappear for the umpteenth time and not show up.", comment: ""),
        NSLocalizedString("Who would really care?", comment: ""),
        NSLocalizedString("Hmm... However, others might be hurt. I might hurt them.", comment: ""),
        NSLocalizedString("Would my absence really hurt anyone? Funny, but from what they wrote it would seem so.", comment: ""),
        NSLocalizedString("But after all, what do I care? It is just a simple dinner, I would not miss anything...", comment: ""),
        NSLocalizedString("Yes, I will stay home this time too. Nothing can go wrong here.", comment: ""),
        NSLocalizedString("I have everything I need to be happy. Or at least, that's how I tell myself...", comment: ""),
        NSLocalizedString("my own space, my own passions, my own time... after all, every now and then even just that breeze coming from the window is enough to shake me for a moment.", comment: ""),
        "..",
        "....",
        "......",
        NSLocalizedString("But who am I kidding? Me, worrying about hurting them? They don't give a damn about me at all (although deep down I hope they do).", comment: ""),
        NSLocalizedString("They've never even seen me, so how can I blame them after all.", comment: ""),
        NSLocalizedString("The only person I would really let down would be me. Again.", comment: ""),
        NSLocalizedString("It's a simple outing, a simple dinner.", comment: ""),
        "...",
        NSLocalizedString("All right. So I decided to go there.", comment: ""),
        NSLocalizedString("...well. I'd better leave early, it's a far place and I want to make sure I get there in time...", comment: ""),
        NSLocalizedString("...I have no idea what to wear. Maybe I could try something new, like a nice jacket, a shirt...", comment: ""),
        NSLocalizedString("Too weird. Too different. Too 'not me.'", comment: ""),
        NSLocalizedString("No, definitely not.", comment: ""),
        NSLocalizedString("I think I'll go with my usual clothes. They make me feel safe.", comment: ""),
        NSLocalizedString("Why put so much effort into such stupidity? It's not like I should be rewarded for style.", comment: ""),
        NSLocalizedString("For effort? That one does.", comment: ""),
        NSLocalizedString("Just take a simple breath, jump in and everything will be fine.", comment: ""),
        NSLocalizedString("Let me first check if I got everything, just in case.", comment: ""),
        NSLocalizedString("Let's see...", comment: ""),
        NSLocalizedString("So it's time, apparently.", comment: "")
    ]
    
    let itemsThinking = [
        //0 = Start
        NSLocalizedString("Let's see...", comment: ""),
        //1 = Calendar
        NSLocalizedString("I haven't updated it in a while now; in fact, I've almost lost track of the days.", comment: "Calendar"),
        //2 = Computer
        NSLocalizedString("I still have the chat open actually, I've given my word by now, and then thinking about it I really want to go there.", comment: "Computer"),
        //3 = Windows
        NSLocalizedString("Maybe I'll take a peek outside: Nothing extraordinary, although it looks like a beautiful day. Amazing that somewhere out there are people waiting for me.", comment: "Windows"),
        //4 = Poster
        NSLocalizedString("My favorite game: Dark Sauce! How many hours will I have spent on it? Way too many, although I never get tired of it.", comment: "Poster"),
        //5 = Trash
        NSLocalizedString("I should empty it out. But then I think, “What happens if I don't?” And the answer is: absolutely nothing. Perfect, I can put it off.", comment: "Trash"),
        //6 = Backpack
        NSLocalizedString("It seems a bit pointless to bring it just for headphones, maybe I could bring something\nto eat as well...", comment: "Backpack"),
        //7 = Hatsune Miku
        "Hatsune Miku?!?!",
        //8 = Headphones
        NSLocalizedString("My old friends, should I bring them? It's still a nice subway ride, and my comfort music usually helps... Nha, it won't go like that! Right?", comment: "Headphones"),
        //9 = Bed
        NSLocalizedString("Still undone, definitely too long ago. I really should do it again. Or I can leave it like that, I'll be back in a few hours anyway. Hmm, i think about it some more...", comment: "Bed")
    ]
    
    @State var disappearItemClickable = [1, 1, 1, 1, 1, 1, 1, 1, 1]
    
    var body: some View {
        ZStack {
            Rectangle()
                .hidden()
            
            Button {
                soundButton.toggle()
            } label: {
                if soundButton == true {
                    Image(systemName: "speaker.wave.2.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 730, maxHeight: 30, alignment: .topLeading)
                        .foregroundStyle(.white)
                } else {
                    Image(systemName: "speaker.slash.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 730, maxHeight: 30, alignment: .topLeading)
                        .foregroundStyle(.white)
                }
            }
            .offset(x: 5, y: -165)
            
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
                        .opacity(!isAnimatingText || itemClicked == 1 ? 1 : 0.5)
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
                        .opacity(!isAnimatingText || itemClicked == 2 ? 1 : 0.5)
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
                        .opacity(!isAnimatingText || itemClicked == 3 ? 1 : 0.5)
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
                        .opacity(!isAnimatingText || itemClicked == 4 ? 1 : 0.5)
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
                        .offset(x: -350, y: 150)
                        .opacity(!isAnimatingText || itemClicked == 5 ? 1 : 0.5)
                        .disabled(isAnimatingText)
                    }
                    
                    if disappearItemClickable[5] == 1 {
                        Button {
                            itemClicked = 6
                            counterClicked -= 1
                            disappearItemClickable[5] = 0
                        } label: {
                            Rectangle()
                                .fill(Color.white)
                                .scaledToFit()
                                .frame(width: 65)
                                .mask {
                                    Image(systemName: "questionmark.bubble")
                                }
                                .offset(x: 10, y: 5)
                        }
                        .offset(x: -270, y: 150)
                        .opacity(!isAnimatingText || itemClicked == 6 ? 1 : 0.5)
                        .disabled(isAnimatingText)
                    }
                    
                    if disappearItemClickable[6] == 1 {
                        Button {
                            itemClicked = 7
                            counterClicked -= 1
                            disappearItemClickable[6] = 0
                        } label: {
                            Rectangle()
                                .fill(Color.white)
                                .scaledToFit()
                                .frame(width: 65)
                                .mask {
                                    Image(systemName: "questionmark.bubble")
                                }
                        }
                        .offset(x: 250, y: 35)
                        .opacity(!isAnimatingText || itemClicked == 7 ? 1 : 0.5)
                        .disabled(isAnimatingText)
                    }
                    
                    if disappearItemClickable[7] == 1 {
                        Button {
                            itemClicked = 8
                            counterClicked -= 1
                            disappearItemClickable[7] = 0
                        } label: {
                            Rectangle()
                                .fill(Color.white)
                                .frame(width: 50, height: 60)
                                .mask {
                                    Image(systemName: "questionmark.bubble")
                                }
                        }
                        .offset(x: 285, y: 30)
                        .opacity(!isAnimatingText || itemClicked == 8 ? 1 : 0.5)
                        .disabled(isAnimatingText)
                    }
                    
                    if disappearItemClickable[8] == 1 {
                        Button {
                            itemClicked = 9
                            counterClicked -= 1
                            disappearItemClickable[8] = 0
                        } label: {
                            Rectangle()
                                .fill(Color.white)
                                .frame(width: 520, height: 70)
                                .mask {
                                    Image(systemName: "questionmark.bubble")
                                }
                                .offset(x: 80, y: 10)
                        }
                        .offset(x: 80, y: 180)
                        .opacity(!isAnimatingText || itemClicked == 9 ? 1 : 0.5)
                        .disabled(isAnimatingText)
                    }
                }
            }
        }
        .background(
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                
                Image("Bedroom")
                    .resizable()
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
                        
                        if soundButton == true {
                            SoundManager.instance.playSound(sound: .soundEffect)
                        }
                    } onEndedAnimation: {
                        isAnimatingText = false
                        
                        SoundManager.instance.player?.stop()
                    }
                } else {
                    Image(steveReaction)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 160)
                        .offset(x: -280, y: 120)
                    
                    TypewriterTextView(text: dialogues[dialogueNumber]) {
                        isAnimatingText = true
                        steveReaction = "Steve_NeutralTalk"
                        
                        if soundButton == true {
                            SoundManager.instance.playSound(sound: .soundEffect)
                        }
                    } onEndedAnimation: {
                        isAnimatingText = false
                        steveReaction = "Steve_Neutral"
                        SoundManager.instance.player?.stop()
                    }
                }
            }
        )
    }
}

#Preview {
    BedroomView(screen: .constant(.bedroom))
}
