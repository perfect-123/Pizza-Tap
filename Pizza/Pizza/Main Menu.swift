//
//  Main Menu.swift
//  Pizza
//
//  Created by Perfect Ackah on 3/19/23.
//

import SwiftUI

struct Main_Menu: View {
    @State var switchView = false
   @State var isblinking = false
    
    var body: some View {

            ZStack{
                let highScore = UserDefaults.standard.integer(forKey: "HighScore")
                RoundedRectangle(cornerRadius: 21)
                    LinearGradient(gradient: Gradient(colors: [Color.red,Color(red: 1.5, green: 0.25, blue: 0.5)]), startPoint: .bottom, endPoint: .top)
                    .edgesIgnoringSafeArea(.all)
                VStack(){
                    Spacer().frame(height: 70)
                    Text("Pizza Tap")
                        .font(.custom("Rajdhani", size: 40))
                    Spacer().frame(height:100)
                    VStack{
                        Text("Highscore")
                            .font(.custom("Rajdhani", size: 30))
                        Text("\(highScore)")
                            .font(.custom("Rajdhani", size: 30))
                    }
                    Spacer()
                        .frame(height: 150)
                    Text("Tap to Play")
                        .font(.custom("Rajdhani", size: 20))
                        .foregroundColor(.white)
                        .onAppear(){
                            withAnimation(Animation.easeInOut(duration: 0.55).repeatForever(autoreverses: true)){
                                isblinking.toggle()
                            }
                        }.opacity(isblinking ? 1:0)
                    Spacer()
                }
            }
            .onTapGesture {
                self.switchView = true
            }
            .fullScreenCover(isPresented: $switchView) {
                Play()
            }
        .onAppear(){
            playSound(sound: "Intro", type: "mp3")
        }
    }
}

struct Main_Menu_Previews: PreviewProvider {
    static var previews: some View {
        Main_Menu()
    }
}
