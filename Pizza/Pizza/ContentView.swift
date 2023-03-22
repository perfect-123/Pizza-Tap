//
//  ContentView.swift
//  Pizza
//
//  Created by Perfect Ackah on 2/2/23.

import SwiftUI
import ConfettiSwiftUI

struct Play: View {
    @State var gamestarted : Bool = false
    @State var num = 0
    @State var counter = 0
    @State var isRotating = 0.0
    @State var timeremaining = 500
    @State var xPos : CGFloat = 200
    @State var yPos : CGFloat = 325
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()

    var body: some View {

        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color(red: 0.01 + 0.2 * Double(num)/20, green: 0.1 + 0.1 * Double(num)/20, blue: 0.1 + 0.56 * Double(num)/20),Color(red: 1 + Double(timeremaining/100) * 0.1, green: Double(timeremaining/200) * 0.1, blue: Double(timeremaining/100) * 0.1)]), startPoint: .bottom, endPoint: .top)
                .edgesIgnoringSafeArea(.all)
        VStack{
            HStack(spacing: 80){
                reset
                Countdown
                NumberOfClicks
            }
            
            GeometryReader{
                Geometry in
                Pizza
                    .position(x: xPos, y: yPos)
                    .onTapGesture {
                        instantSound(sound: "tap sound", type: "mp3")
                        //Possible x and y coordinate
                        xPos = CGFloat.random(in: 50...340)
                        yPos = CGFloat.random(in: 50...650)
                        num += 1
                        timeremaining += 40
                        
                        if num % 10 == 0{
                            counter += 1
                            print("Here")
                        }
                    }
            }.confettiCannon(counter: $counter)
                .onAppear{
                    playSound(sound: "lifelike-126735", type: "mp3")
            }
        }
    }
        .fullScreenCover(isPresented: $gamestarted) {
            Main_Menu()
    }
}
    //Countdown timer
    var Countdown: some View{
        VStack{
            //the countdown is on 2 decimal places
            Text("\(timeremaining / 100).\(String(format: "%02d", timeremaining % 100))")
                .font(.custom("Rajdhani", size: 20))

        }
            .onReceive(timer){_ in
                if timeremaining > 0 {
                    timeremaining -= Int(1)
            }
                else{
                    gamestarted = true
                    let highScore = UserDefaults.standard.integer(forKey: "HighScore")
                    if num > highScore{
                        UserDefaults.standard.set(num, forKey: "HighScore")
                    }
                }
        }
    }
    //: Track the Clicks
    var NumberOfClicks: some View {
        Text("\(num)")
            .font(.custom("Rajdhani", fixedSize: 40)
               )
    }
    //: Rotating Pizza
    var Pizza: some View {
        Image("Pizza Time")
            .resizable()
            .rotationEffect(.degrees(isRotating))
            .frame(width: 70, height: 70)
            .onAppear{
            withAnimation(.linear(duration: 1.0).speed(0.5).repeatForever(autoreverses: false)){
                isRotating = 360
            }
        }
    }
    //:RESET
    var reset: some View{
        Image(systemName: "flag.checkered.2.crossed")
            .onTapGesture {
                gamestarted = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Play()
    }
}
