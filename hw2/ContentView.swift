import SwiftUI
import AVFoundation

extension AVPlayer {
    static let sharedDingPlayer: AVPlayer = {
        guard let url = Bundle.main.url(forResource: "ding", withExtension:
        "mp3") else { fatalError("Failed to find sound file.") }
        return AVPlayer(url: url)
    }()

    func playFromStart() {
        seek(to: .zero)
        play()
    }
    
    static var bgQueuePlayer = AVQueuePlayer()
    static var bgPlayerLooper: AVPlayerLooper!
    static func setupBgMusic() {
        guard let url = Bundle.main.url(forResource: "bgm",
        withExtension: "mp3") else { fatalError("Failed to find sound file.") }
        let item = AVPlayerItem(url: url)
        bgPlayerLooper = AVPlayerLooper(player: bgQueuePlayer, templateItem: item)
    }
    static func setupBgMusic1() {
        guard let url = Bundle.main.url(forResource: "bgm1",
        withExtension: "mp3") else { fatalError("Failed to find sound file.") }
        let item = AVPlayerItem(url: url)
        bgPlayerLooper = AVPlayerLooper(player: bgQueuePlayer, templateItem: item)
    }
    static func setupBgMusic2() {
        guard let url = Bundle.main.url(forResource: "bgm2",
        withExtension: "mp3") else { fatalError("Failed to find sound file.") }
        let item = AVPlayerItem(url: url)
        bgPlayerLooper = AVPlayerLooper(player: bgQueuePlayer, templateItem: item)
    }
}

struct ContentView: View {
//    var dingPlayer: AVPlayer { AVPlayer.sharedDingPlayer }
    @State var show = false
    @State var style = false
    @State var htp = false
    @State var compute = false
    @State var stts = false
    @AppStorage("uwin") var uwin: Int = 0
    @AppStorage("p1win") var p1win: Int = 0
    @AppStorage("p2win") var p2win: Int = 0
    var body: some View {
        ZStack{
            Image("bac")
                .resizable()
                .ignoresSafeArea()
                .onAppear(){
                    AVPlayer.setupBgMusic2()
                    AVPlayer.bgQueuePlayer.play()
                }
            HStack{
                GeometryReader{geometry in
                    Image("font")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width*1.5)
                        .padding(EdgeInsets(top: geometry.size.height/8, leading: geometry.size.width/6, bottom: 0, trailing: 0))
                    VStack{
                        
                        HStack{
                            Button("VS Human"){
                                AVPlayer.setupBgMusic2()
                                AVPlayer.bgQueuePlayer.pause()
                                show.toggle()
                            }
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
                            .fullScreenCover(isPresented: $show, content: {
                                SwiftUIView(show: $show,style:$style)
                            })
                            Button("VS Computer"){
                                AVPlayer.setupBgMusic2()
                                AVPlayer.bgQueuePlayer.pause()
                                compute.toggle()
                            }
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
                            .fullScreenCover(isPresented: $compute, content: {
                                computer(compute: $compute,style: $style)
                            })
                        }
                        HStack{
                            Button("Statistics"){
                                stts.toggle()
                            }
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
                            .sheet(isPresented: $stts, content: {statistics(stts:$stts)})
                            Button("How to play"){
                                htp.toggle()
                            }
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
                            .fullScreenCover(isPresented: $htp, content: {hw2.help(htp: $htp)})
                        }
                    }
                    .padding(EdgeInsets(top: geometry.size.height/1.9, leading: geometry.size.width/3.1, bottom: 0, trailing: 0))

                }
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
