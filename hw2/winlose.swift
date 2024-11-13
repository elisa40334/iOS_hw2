//
//  winlose.swift
//  hw2
//
//  Created by Elisa Chien on 2023/3/28.
//

import SwiftUI
//@Binding var show:posi
struct winlose: View {
    @State var firstpage = false
    @State var again = false
    @Binding var show:Bool
    @Binding var posi:Bool
    @Binding var win:Bool
    @Binding var tie:Bool
    @Binding var p1:Int
    @Binding var p2:Int
    @Binding var style:Bool
    @AppStorage("uwin") var uwin: Int = 0
    @AppStorage("p1win") var p1win: Int = 0
    @AppStorage("p2win") var p2win: Int = 0
    @AppStorage("ulose") var ulose: Int = 0
    @AppStorage("p1lose") var p1lose: Int = 0
    @AppStorage("p2lose") var p2lose: Int = 0
    @AppStorage("udraw") var udraw: Int = 0
    @AppStorage("p1draw") var p1draw: Int = 0
    @AppStorage("p2draw") var p2draw: Int = 0
    var body: some View {
        ZStack{
            GeometryReader{geometry in
                Image("bac")
                    .resizable()
                    .ignoresSafeArea()
                VStack{
                    Spacer()
                    VStack{
                        Spacer()
                        if tie{
                            Text("DRAW!")
                                .bold()
                                .fontWeight(.bold)
                                .font(.title)
                                .foregroundColor(Color.white)
//                                .padding(EdgeInsets(top: 0, leading: -geometry.size.width/8, bottom: 0, trailing: 0))
                        }
                        else{
                            if !posi{
                                Text(win ? "PLAYER 1 WIN!" : "PLAYER 2 WIN!")
                                    .bold()
                                    .fontWeight(.bold)
                                    .font(.title)
                                    .foregroundColor(Color.white)
                            }
                            else{
                                Text(win ? "YOU WIN!" : "YOU LOSE!")
                                    .bold()
                                    .fontWeight(.bold)
                                    .font(.title)
                                    .foregroundColor(Color.white)
                            }
                        }
                        
                        HStack{
                            Text(posi ? "YOU:\(p1)" : "PLAYER 1:\(p1)")
                                .frame(width: 160, height: 40)
                                .bold()
                                .foregroundColor(Color(red: 0.312, green: 0.495, blue: 0.59))
                                .background(Color.white)
                                .cornerRadius(5)
                            Text(posi ? "COMPUTER:\(p2)" : "PLAYER 2:\(p2)")
                                .frame(width: 150, height: 40)
                                .bold()
                                .foregroundColor(Color(red: 0.312, green: 0.495, blue: 0.59))
                                .background(Color.white)
                                .cornerRadius(5)
                        }
                        HStack{
                            if !posi{
                                Button("Play Again"){
                                    again.toggle()
                                }.fullScreenCover(isPresented: $again, content: {
                                    SwiftUIView(show: $show,style:$style)
                                })
                                .foregroundColor(Color(red: 0.312, green: 0.495, blue: 0.59))
                                .bold()
                                .frame(width: geometry.size.width/6.9,height: geometry.size.height/17)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(40)
                                .padding(5)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 40)
                                        .stroke(Color.white, lineWidth: 2.5)
                                )
                            }
                            else{
                                Button("Play Again"){
                                    again.toggle()
                                }.fullScreenCover(isPresented: $again, content: {
                                    computer(compute: $show,style:$style)
                                })
                                .foregroundColor(Color(red: 0.312, green: 0.495, blue: 0.59))
                                .bold()
                                .frame(width: geometry.size.width/6.9,height: geometry.size.height/17)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(40)
                                .padding(5)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 40)
                                        .stroke(Color.white, lineWidth: 2.5)
                                )
                            }
                            Button("Back To Title"){
                                firstpage.toggle()
                            }.fullScreenCover(isPresented: $firstpage, content: {ContentView()})
                                .foregroundColor(Color(red: 0.312, green: 0.495, blue: 0.59))
                                .bold()
                                .frame(width: geometry.size.width/6.9,height: geometry.size.height/17)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(40)
                                .padding(5)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 40)
                                        .stroke(Color.white, lineWidth: 2.5)
                                )
                        }
                        Spacer()
                    }
                    Spacer()
                }
            }
        }
    }
}

struct winlose_Previews: PreviewProvider {
    static var previews: some View {
        winlose(show:.constant(true),posi:.constant(true),win:.constant(true),tie:.constant(true),p1:.constant(0),p2:.constant(0),style: .constant(true))
    }
}
