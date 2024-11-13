//圖
//  ContentView.swift
//  test1
//
//  Created by Elisa Chien on 2023/3/27.
//

import SwiftUI

import AVFoundation

struct setting: View {
    @Binding var sett:Bool
    @Binding var style:Bool
    @Binding var music:Bool
    @Binding var soundd:Bool
    @State var playm = 0
    var body: some View {
        VStack{
            ZStack{
                Color(red: 0.841, green: 0.936, blue: 0.965)
                    .ignoresSafeArea()
                VStack{
                    Text("Settings")
                        .bold()
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(Color.white)
                    VStack{
                        HStack{
                            Text("Music: ")
                                .foregroundColor(Color(red: 0.312, green: 0.495, blue: 0.59))
                                .bold()
                                .fontWeight(.bold)
                                .font(.title)
                                .frame(width: 100)
                            Text("1")
                                .foregroundColor(Color(red: 0.312, green: 0.495, blue: 0.59))
                                .bold()
                                .fontWeight(.bold)
                                .font(.title)
                                .frame(width: 100,height: 50)
                                .background(!music ? Color.white : (playm == 1 ? Color(red: 0.841, green: 0.936, blue: 0.965) : Color.white))
                                .cornerRadius(40)
                                .onTapGesture {
                                    music = true
                                    playm = 1
                                    AVPlayer.bgQueuePlayer.pause()
                                    AVPlayer.setupBgMusic1()
                                    AVPlayer.bgQueuePlayer.play()
                                }
                                .overlay{
                                    RoundedRectangle(cornerRadius: 40)
                                        .stroke(Color(red: 0.312, green: 0.495, blue: 0.59), lineWidth: 2.5)
                                }
                            Text("2")
                                .foregroundColor(Color(red: 0.312, green: 0.495, blue: 0.59))
                                .bold()
                                .fontWeight(.bold)
                                .font(.title)
                                .frame(width: 100,height: 50)
                                .background(!music ? Color.white : (playm == 2 ? Color(red: 0.841, green: 0.936, blue: 0.965) : Color.white))
                                .cornerRadius(40)
                                .onTapGesture {
                                    music = true
                                    playm = 2
                                    AVPlayer.bgQueuePlayer.pause()
                                    AVPlayer.setupBgMusic()
                                    AVPlayer.bgQueuePlayer.play()
                                }
                                .overlay{
                                    RoundedRectangle(cornerRadius: 40)
                                        .stroke(Color(red: 0.312, green: 0.495, blue: 0.59), lineWidth: 2.5)
                                }
                            Text("OFF")
                                .foregroundColor(Color(red: 0.312, green: 0.495, blue: 0.59))
                                .bold()
                                .fontWeight(.bold)
                                .font(.title)
                                .frame(width: 100,height: 50)
                                .background(music ? Color.white : Color(red: 0.841, green: 0.936, blue: 0.965))
                                .cornerRadius(40)
                                .onTapGesture {
                                    music = false
                                    AVPlayer.bgQueuePlayer.pause()
                                }
                                .overlay{
                                    RoundedRectangle(cornerRadius: 40)
                                        .stroke(Color(red: 0.312, green: 0.495, blue: 0.59), lineWidth: 2.5)
                                }
                        }
                        HStack{
                            Text("Sound effects: ")
                                .foregroundColor(Color(red: 0.312, green: 0.495, blue: 0.59))
                                .bold()
                                .fontWeight(.bold)
                                .font(.title)
                                .frame(width: 200)
                            Text("ON")
                                .foregroundColor(Color(red: 0.312, green: 0.495, blue: 0.59))
                                .bold()
                                .fontWeight(.bold)
                                .font(.title)
                                .frame(width: 100,height: 50)
                                .background(!soundd ? Color.white : Color(red: 0.841, green: 0.936, blue: 0.965))
                                .cornerRadius(40)
                                .onTapGesture {
                                    soundd = true
                                }
                                .overlay{
                                    RoundedRectangle(cornerRadius: 40)
                                        .stroke(Color(red: 0.312, green: 0.495, blue: 0.59), lineWidth: 2.5)
                                }
                            Text("OFF")
                                .foregroundColor(Color(red: 0.312, green: 0.495, blue: 0.59))
                                .bold()
                                .fontWeight(.bold)
                                .font(.title)
                                .frame(width: 100,height: 50)
                                .background(soundd ? Color.white : Color(red: 0.841, green: 0.936, blue: 0.965))
                                .cornerRadius(40)
                                .onTapGesture {
                                    soundd = false
                                }
                                .overlay{
                                    RoundedRectangle(cornerRadius: 40)
                                        .stroke(Color(red: 0.312, green: 0.495, blue: 0.59), lineWidth: 2.5)
                                }
                        }
                        HStack{
                            Text("Switch style: ")
                                .foregroundColor(Color(red: 0.312, green: 0.495, blue: 0.59))
                                .bold()
                                .fontWeight(.bold)
                                .font(.title)
                                .frame(width: 200)
                            Text("1")
                                .foregroundColor(Color(red: 0.312, green: 0.495, blue: 0.59))
                                .bold()
                                .fontWeight(.bold)
                                .font(.title)
                                .frame(width: 100,height: 50)
                                .background(style ? Color.white : Color(red: 0.841, green: 0.936, blue: 0.965))
                                .cornerRadius(40)
                                .onTapGesture {
                                    style = false
                                }
                                .overlay{
                                    RoundedRectangle(cornerRadius: 40)
                                        .stroke(Color(red: 0.312, green: 0.495, blue: 0.59), lineWidth: 2.5)
                                }
                            Text("2")
                                .foregroundColor(Color(red: 0.312, green: 0.495, blue: 0.59))
                                .bold()
                                .fontWeight(.bold)
                                .font(.title)
                                .frame(width: 100,height: 50)
                                .background(!style ? Color.white : Color(red: 0.841, green: 0.936, blue: 0.965))
                                .cornerRadius(40)
                                .onTapGesture {
                                    style = true
                                }
                                .overlay{
                                    RoundedRectangle(cornerRadius: 40)
                                        .stroke(Color(red: 0.312, green: 0.495, blue: 0.59), lineWidth: 2.5)
                                }
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
                sett.toggle()
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

struct setting_Previews: PreviewProvider {
    static var previews: some View {
        setting(sett: .constant(true), style: .constant(true), music: .constant(true), soundd: .constant(true))
    }
}
