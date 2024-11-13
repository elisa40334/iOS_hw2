//old
//  SwiftUIView.swift
//  aa
//
//  Created by User05 on 2023/3/15.
//

import SwiftUI
import AVFoundation

struct SwiftUIView: View {
    var dingPlayer: AVPlayer { AVPlayer.sharedDingPlayer }
    @Binding var show:Bool
    @Binding var style:Bool
//    @State var arr = [0,0,0,0,0,0,0,0,0,0,0,0,0,0]
//    @State var arr = [0,0,0,0,0,1,5,1,0,0,0,0,0,4]
    @State var arr = [4,4,4,4,4,4,0,4,4,4,4,4,4,0]
    @State var now = 1
    @State var kkk = 1
    @State var cal = 0
    @State var cal2 = 0
    @State var cal3 = 0
    @State var posi = false
    @State var re = false
    @State var endd = false
    @State var win = false
    @State var tie = false
    @State var sett = false
    @State var music = false
    @State var soundd = false
    @AppStorage("uwin") var uwin: Int = 0
    @AppStorage("p1win") var p1win: Int = 0
    @AppStorage("p2win") var p2win: Int = 0
    @AppStorage("ulose") var ulose: Int = 0
    @AppStorage("p1lose") var p1lose: Int = 0
    @AppStorage("p2lose") var p2lose: Int = 0
    @AppStorage("udraw") var udraw: Int = 0
    @AppStorage("p1draw") var p1draw: Int = 0
    @AppStorage("p2draw") var p2draw: Int = 0
    
    fileprivate func f1(j: Int ,i:Int) {
        if now == 0 && i == 0 && arr[12-j] != 0{
            cal3 = 0
            for kk in (0..<arr[12-j]){
                let aa = (kk+12-j+1)%14
                if aa != 6{
                    arr[aa] += 1
                }
                else{
                    cal3 += 1
                    var bb = (arr[12-j]+12-j+cal3)%14
                    arr[bb] += 1
                }
            }
            if 12-j+arr[12-j] == 13{
                now = 0
            }
            else{
                now = 1
            }
            if arr[(arr[12-j]+12-j)%14] == 1 && (arr[12-j]+12-j)%14 >= 7 && (arr[12-j]+12-j)%14 <= 12 && arr[12-(arr[12-j]+12-j)%14] != 0{
                arr[13] += (arr[12-(arr[12-j]+12-j)%14]+1)
                arr[12-(arr[12-j]+12-j)%14] = 0
                arr[(arr[12-j]+12-j)%14] = 0
            }
            arr[12-j] = 0
            
            cal = 0
            cal2 = 0
            for kk in (7..<13){
                if arr[kk] != 0{
                    cal += 1
                }
                if arr[kk-7] != 0{
                    cal2 += 1
                }
            }
            if cal == 0 || cal2 == 0{
                for kk in (0..<6){
                    arr[6] += arr[kk]
                    arr[kk] = 0
                }
                endd.toggle()
                if arr[6] > arr[13]{
                    win = true
                }
                else if arr[6] == arr[13]{
                    tie = true
                }
                else{
                    win = false
                }
                show.toggle()
            }
        }
        else if now == 1 && i == 1 && arr[j] != 0{
            cal3 = 0
            for kk in (0..<arr[j]){
                var aa = (kk+j+1)%14
                if aa != 13{
                    arr[aa] += 1
                }
                else{
                    cal3 += 1
                    var bb = (arr[j]+j+cal3)%14
                    arr[bb] += 1
                }
            }
            if j+arr[j] == 6{
                now = 1
            }
            else{
                now = 0
            }
            if arr[(j+arr[j])%14] == 1 && (j+arr[j])%14 >= 0 && (j+arr[j])%14 <= 5 && arr[12-(j+arr[j])%14] != 0{
                arr[6] += (arr[12-(j+arr[j])%14]+1)
                arr[12-((j+arr[j])%14)] = 0
                arr[(j+arr[j])%14] = 0
            }
            arr[j] = 0
            
            cal = 0
            cal2 = 0
            for kk in (0..<6){
                if arr[kk] != 0{
                    cal += 1
                }
                if arr[kk+7] != 0{
                    cal2 += 1
                }
            }
            if cal == 0 || cal2 == 0{
                for kk in (7..<13){
                    arr[13] += arr[kk]
                    arr[kk] = 0
                }
                endd.toggle()
                if arr[6] > arr[13]{
                    win = true
                    p1win += 1
                    p2lose += 1
                }
                else if arr[6] == arr[13]{
                    tie = true
                    p1draw += 1
                    p2draw += 1
                }
                else{
                    win = false
                    p2win += 1
                    p1lose += 1
                }
            }
        }
    }
    
    var body: some View {
        GeometryReader{geometry in
            ZStack{
                Image(style ? "b5" : "b2")
                    .resizable()
                    .ignoresSafeArea()
                VStack {
                    HStack{
                        VStack{
                            Text("\(arr[13])")
                                .foregroundColor(style ? Color.white : Color(red: 0.312, green: 0.495, blue: 0.59))
                            ZStack{
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(style ? Color.white : Color(red: 0.312, green: 0.495, blue: 0.59), lineWidth: 5)
                                    .frame(width:floor(geometry.size.width/9),height: geometry.size.height/2)
//                                    .shadow(color: .black, radius: 10)
                                ForEach(0..<(arr[13]), id: \.self){_ in
                                    Image(style ? "star\(Int.random(in:1...5))" : "stone\(Int.random(in:1...5))" )
//                                        .shadow(radius: 30,Color.blue)
                                        .resizable()
                                        .frame(width: geometry.size.width/30,height:geometry.size.width/30)
                                        .foregroundColor(Color.yellow)
                                        .offset(x:CGFloat.random(in: -floor(geometry.size.width/27)...floor(geometry.size.width/27)), y:CGFloat.random(in: -floor(geometry.size.height/6)...floor(geometry.size.height/6)))
                                        .shadow(color: .white, radius: 10)
                                }
                            }
                        }
                        VStack{
                            ForEach(0..<2){i in
                                HStack{
                                    ForEach (0..<6){j in
                                        VStack {
                                            Text(i == 0 ? "\(arr[12-j])" : "")
                                                .foregroundColor(style ? Color.white : Color(red: 0.312, green: 0.495, blue: 0.59))
//                                            Color(hue: 0.129, saturation: 1.0, brightness: 1.0)
//                                            Color(red: 0.502, green: 0.655, blue: 0.709)
//                                            Color(red: 0.98, green: 0.838, blue: 0.647)
//                                            Color(red: 0.98, green: 0.838, blue: 0.647)
                                            ZStack{
                                                Circle()
                                                    .stroke((i == 0 && now == 0 && arr[12-j] != 0) || (i == 1 && now == 1 && arr[j] != 0) ? (style ? Color(red: 0.839, green: 0.655, blue: 0.258) : Color(red: 0.98, green: 0.838, blue: 0.647)) : (style ? Color.white : Color(red: 0.312, green: 0.495, blue: 0.59)), lineWidth: 5)
                                                    .frame(height: floor(geometry.size.width/9))
                                                    .fullScreenCover(isPresented: $endd, content: {winlose(show: $show,posi:$posi,win:$win,tie:$tie,p1: $arr[6],p2: $arr[13],style:$style)})
                                                    .onTapGesture {
                                                        f1(j: j, i: i)
                                                        if soundd && ((i == 0 && now == 0 && arr[12-j] != 0) || (i == 1 && now == 1 && arr[j] != 0)){
                                                            dingPlayer.playFromStart()
                                                        }
                                                    }
//                                                    .shadow(color: .black, radius: 10)
                                                ForEach(0..<(i == 1 ? arr[j] : arr[12-j]), id: \.self){_ in
                                                    Image(style ? "star\(Int.random(in:1...5))" : "stone\(Int.random(in:1...5))" )
                                                        .resizable()
                                                        .frame(width: geometry.size.width/30,height:geometry.size.width/30)
                                                        .foregroundColor(Color.yellow)
                                                        .offset(x:CGFloat.random(in: -floor(geometry.size.width/27)...floor(geometry.size.width/27)), y:CGFloat.random(in: -floor(geometry.size.width/27)...floor(geometry.size.width/27)))
                                                        .onTapGesture {
                                                            if soundd && ((i == 0 && now == 0 && arr[12-j] != 0) || (i == 1 && now == 1 && arr[j] != 0)){
                                                                dingPlayer.playFromStart()
                                                            }
                                                            f1(j: j, i: i)}
                                                        .shadow(color: .white, radius: 10)
                                                }
                                            }
                                            
        
                                            Text(i == 1 ? "\(arr[j])" : "")
                                                .foregroundColor(style ? Color.white : Color(red: 0.312, green: 0.495, blue: 0.59))
                                        }
                                            
                                    }
                                }
                            }
                        }
                        
                        VStack{
                            ZStack{
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(style ? Color.white : Color(red: 0.312, green: 0.495, blue: 0.59), lineWidth: 5)
                                    .frame(width:floor(geometry.size.width/9),height: geometry.size.height/2)
//                                    .shadow(color: .black, radius: 10)
                                ForEach(0..<(arr[6]), id: \.self){_ in
                                    Image(style ? "star\(Int.random(in:1...5))" : "stone\(Int.random(in:1...5))" )
//                                       .shadow(color: style ? .white : .gray, radius: 10)
                                        .resizable()
                                        .frame(width: geometry.size.width/30,height:geometry.size.width/30)
                                        .foregroundColor(Color.yellow)
                                        .offset(x:CGFloat.random(in: -floor(geometry.size.width/27)...floor(geometry.size.width/27)), y:CGFloat.random(in: -floor(geometry.size.height/6)...floor(geometry.size.height/6)))
                                        .shadow(color: .white, radius: 10)
                                }
                            }
                            Text("\(arr[6])")
                                .foregroundColor(style ? Color.white : Color(red: 0.312, green: 0.495, blue: 0.59))
                        }
                    }.padding(EdgeInsets(top: geometry.size.height/11, leading: geometry.size.width/36, bottom: 0, trailing: 0))
                    HStack{
                        Text(now == 1 ? "PLAYER1" : "PLAYER2")
    //                        .foregroundColor(style ? Color.white : Color(red: 0.312, green: 0.495, blue: 0.59))
                            .frame(width: 100, height: 40)
                            .bold()
                            .foregroundColor(style ? Color.black : Color.white)
                            .background(style ? Color.white : Color(red: 0.312, green: 0.495, blue: 0.59))
                            .cornerRadius(5)
                            .padding(EdgeInsets(top: 0, leading: -geometry.size.width/8, bottom: 0, trailing: 0))
                        Button("Switch"){
                            style.toggle()
                        }.foregroundColor(style ? Color.black : Color.white)
                            .bold()
                            .padding()
                            .background(style ? Color.white : Color(red: 0.312, green: 0.495, blue: 0.59))
                            .cornerRadius(40)
                            .padding(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(style ? Color.white : Color(red: 0.312, green: 0.495, blue: 0.59), lineWidth: 2.5)
                            )
                            .padding(EdgeInsets(top: 0, leading: geometry.size.width/4, bottom: 0, trailing: 0))
                        
                        Button("Settings"){
                            sett.toggle()
                        }
//                        .foregroundColor(style ? Color.white : Color(red: 0.312, green: 0.495, blue: 0.59))
                        .sheet(isPresented: $sett, content: {setting(sett: $sett,style: $style,music:$music,soundd:$soundd)})
                        .foregroundColor(style ? Color.black : Color.white)
                            .bold()
                            .padding()
                            .background(style ? Color.white : Color(red: 0.312, green: 0.495, blue: 0.59))
                            .cornerRadius(40)
                            .padding(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(style ? Color.white : Color(red: 0.312, green: 0.495, blue: 0.59), lineWidth: 2.5)
                            )
//                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: -geometry.size.width/5))
                        Button("Back to title"){
                            AVPlayer.bgQueuePlayer.pause()
                            re.toggle()
                        }.foregroundColor(style ? Color.black : Color.white)
                            .fullScreenCover(isPresented: $re, content: {ContentView()})                            .bold()
                            .padding()
                            .background(style ? Color.white : Color(red: 0.312, green: 0.495, blue: 0.59))
                            .cornerRadius(40)
                            .padding(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(style ? Color.white : Color(red: 0.312, green: 0.495, blue: 0.59), lineWidth: 2.5)
                            )
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: -geometry.size.width/5))
                            
                    }
                }
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView(show: .constant(true),style: .constant(true))
    }
}
