////
////  Menu.swift
////  Pizza
////
////  Created by Perfect Ackah on 3/3/23.
////
//
//import SwiftUI
//
//struct Menu: View {
//    @State var gameStarted : Bool = false
//
//    var body: some View {
//            return Group{
//                if  gameStarted{
//                    Play()
//                }else{
//                    Text("Hello world")
//                        .onTapGesture {
//                            self.gameStarted = true
//                        }
//                        .onAppear(){
//                            playSound(sound: "Intro", type: "mp3")
//                        }
//                }
//            }
//    }
//}
//
//struct Menu_Previews: PreviewProvider {
//    static var previews: some View {
//        Menu()
//    }
//}
