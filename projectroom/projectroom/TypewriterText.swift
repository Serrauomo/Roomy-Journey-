//
// Created By: Mobile Apps Academy
// Lisence : https://github.com/Mobile-Apps-Academy/MobileAppsAcademyLicense/blob/main/LICENSE.txt
//

import SwiftUI

struct TypewriterTextView: View {
    
    let text: String
    var delay: CGFloat = 50
    var textAlignment: TextAlignment = .leading
    
    var onStartedAnimation: (() -> Void)? = nil
    var onEndedAnimation: (() -> Void)? = nil
    
    @State private var animatedText = ""
    @State private var task: Task<Void, Never>? = nil
    @State private var arrowNextPhrase = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.black)
                .opacity(0.5)
                .frame(width: 550, height: 120)
                .cornerRadius(20)
            
            if arrowNextPhrase == true {
                Image(systemName: "arrowtriangle.right.fill")
                    .foregroundColor(.white)
                    .frame(maxWidth: 520, maxHeight: 90, alignment: .bottomTrailing)
            }
            
            Text(animatedText)
                .multilineTextAlignment(.leading)
                .font(.custom("Silkscreen-Regular", size: 16))
                .foregroundColor(.white)
                .padding(15)
                .frame(width: 550, height: 200)
        }
        .onTapGesture {
            task?.cancel()
            arrowNextPhrase = true
        }
        .offset(x: 80, y: 110)
        .onChange(of: text, initial: true) {
            arrowNextPhrase = false
            
            if let task {
                task.cancel()
                animatedText = ""
            }
            
            task = Task { @MainActor in
                animatedText = ""
                await animate()
            }
        }
    }
    
    private func animate() async {
        onStartedAnimation?()
        
        for char in text {
            animatedText.append(char)
            try? await Task.sleep(for: .milliseconds(delay))
        }
        
        arrowNextPhrase = true
        onEndedAnimation?()
    }
}

struct TypewriterTextView_Previews: PreviewProvider {
    static var previews: some View {
        TypewriterTextView(text: "Test Speeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeed.")
    }
}
