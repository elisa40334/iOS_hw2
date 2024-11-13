//
//  statistics.swift
//  hw2
//
//  Created by Elisa Chien on 2023/3/30.
//

import SwiftUI

struct statistics: View {
    @Binding var stts:Bool
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
        HStack{
            ZStack{
                Color(red: 0.841, green: 0.936, blue: 0.965)
                    .ignoresSafeArea()
                VStack{
                    HStack{
                        Text("Total")
                            .bold()
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(Color.white)
                        Text("Wins")
                            .bold()
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(Color.white)
                        Text("Losses")
                            .bold()
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(Color.white)
                        Text("Draws")
                            .bold()
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(Color.white)
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: -150))
    //                    .multilineTextAlignment(.trailing)
                    VStack{
                        HStack{
                            Text("YOU:            \(uwin + ulose + udraw)        \(uwin)            \(ulose)            \(udraw)")
                                .bold()
                                .fontWeight(.bold)
                                .font(.title)
                                .foregroundColor(Color(red: 0.312, green: 0.495, blue: 0.59))
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        }
                        Text("-------------------------------")
                            .bold()
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(Color(red: 0.312, green: 0.495, blue: 0.59))
                        HStack{
                            Text("Player 1:     \(p1win + p1lose + p1draw)        \(p1win)            \(p1lose)            \(p1draw)")
                                .bold()
                                .fontWeight(.bold)
                                .font(.title)
                                .foregroundColor(Color(red: 0.312, green: 0.495, blue: 0.59))
                        }
                        Text("-------------------------------")
                            .bold()
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(Color(red: 0.312, green: 0.495, blue: 0.59))
                        HStack{
                            Text("Player 2:     \(p2win + p2lose + p2draw)        \(p2win)            \(p2lose)            \(p2draw)")
                                .bold()
                                .fontWeight(.bold)
                                .font(.title)
                                .foregroundColor(Color(red: 0.312, green: 0.495, blue: 0.59))
    //                            .padding(EdgeInsets(top: 0, leading: -180, bottom: 0, trailing: 0))
                            
                        }
                    }.frame(width: 500,height: 230)
                        .background(Color.white)
                        .cornerRadius(30)
                }
                .frame(width: 570,height: 320)
                .background(Color(red: 0.312, green: 0.495, blue: 0.59))
                .cornerRadius(30)
            }
                .overlay(alignment: .topTrailing) {
                Button {
                    stts.toggle()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .padding(20)
                        .foregroundColor(Color(red: 0.312, green: 0.495, blue: 0.59))
                    }
                }
        }
    }
}

struct statistics_Previews: PreviewProvider {
    static var previews: some View {
        statistics(stts:.constant(true))
    }
}
