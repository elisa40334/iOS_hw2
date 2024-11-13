//
//  help.swift
//  hw2
//
//  Created by Elisa Chien on 2023/3/29.
//

import SwiftUI

struct help: View {
    @Binding var htp:Bool
    @State var cal = 0
    @State var txt:[String] = ["遊戲目標是讓靠近自己這排的右邊大洞裝滿愈多的寶石，一開始每人有 24 顆寶石，一個小洞裝 4 顆。"," 輪到玩家的回合時，玩家可移動自己某個小洞的寶石。(大洞的寶石無法移動，大洞的寶石數量代表分數）寶石將一個個逆時針移動到旁邊的，移動上圖這個框框中的 4 個寶石後將變成這張圖。","玩家移動的最後一顆寶石落在自己的大洞時，可以再次移動自己小洞的寶石。寶石移動時不可落在對手的大洞，若遇到對手的大洞，將視而不見跳過。(在本圖中移動我方框框中原本的四顆寶石即可達成)","玩家移動的最後一顆寶石落在自己空的小洞，而且此洞的對面也有寶石時，兩個洞的寶石將被收到玩家的大洞，開心地進補大量分數。(在本圖中移動我方框框中原本的一顆寶石即可將對手框框中的七顆寶石一起收走)","當某一邊的小洞沒有寶石時遊戲結束，此時畫面上小洞的寶石也會成為分數，它們將全部移動到大洞。大洞裡寶石較多的玩家獲勝。"]
    var body: some View {
        
        ZStack{
            Color(red: 0.841, green: 0.936, blue: 0.965)
                .ignoresSafeArea()
            Image("help\(cal)")
                .resizable()
                .ignoresSafeArea()
                .scaledToFit()
                
            HStack{
                GeometryReader{geometry in
                    VStack{
                        
                        Button("RETURN"){
                            htp.toggle()
                        }
                        .foregroundColor(Color.white)
                        .bold()
                        .frame(width: geometry.size.width/10,height: geometry.size.height/30)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(40)
                        .padding(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color.black, lineWidth: 2.5)
                        )
                        .padding(EdgeInsets(top: 5, leading: geometry.size.width/1.2, bottom: 0, trailing: 0))
                        HStack{
                            Button("<"){
                                if cal == 0{
                                    cal = 4
                                }
                                else{
                                    cal -= 1
                                }
                            }
                            .frame(width: 30,height: 30)
                            .padding(1)
                            .background(Color.black)
                            .foregroundColor(Color.white)                      .cornerRadius(40)
                            Text(txt[cal])
                                .multilineTextAlignment(.center)
                                .padding(3)
                                .frame(width: geometry.size.width/1.3,height: geometry.size.width/7.7)
                                .background(Color.black)
                                .cornerRadius(10)
                                .foregroundColor(Color.white)
                            
                            
                            Button(">"){
                                if cal == 4{
                                    cal = 0
                                }
                                else{
                                    cal += 1
                                }
                            }
                            .frame(width: 30,height: 30)
                            .padding(1)
                            .background(Color.black)
                            .foregroundColor(Color.white)                      .cornerRadius(40)
                            
                            
                        }.padding(EdgeInsets(top: geometry.size.height/1.72, leading: 0, bottom: 0, trailing: 0))
                    }
                }
            }
            
//            print(txt[0])
        }
    }
}

struct help_Previews: PreviewProvider {
    static var previews: some View {
        help(htp:.constant(true))
    }
}
