//
//  SecondView.swift
//  Peter015_1
//
//  Created by DONG SHENG on 2022/7/21.
//

import SwiftUI

struct SecondView: View {

    let player: PlayerModel
    
    var body: some View {
        ZStack{
            LinearGradient(gradient:
                            Gradient(
                                colors: [.white.opacity(0.5),.gray.opacity(0.6),.gray.opacity(0.7),  .gray.opacity(0.36), .gray.opacity(0.53),
                                         .gray.opacity(0.5), .gray.opacity(0.63), .gray.opacity(0.75)]
                            ),
                           startPoint: .topLeading,
                                 endPoint: .bottomTrailing)
                .cornerRadius(35)
                .frame(width: 300, height: 300)
            
            VStack(alignment: .leading, spacing: 7){
                Image(player.imageName)
                    .resizable()
                    .cornerRadius(15)
                    .padding(5)
                    .background(Color.black.opacity(0.6).cornerRadius(15))
                    .frame(width: 120, height: 150)
                    .shadow(color: .white.opacity(0.7), radius: 1, x: 1, y: 1)
                    .shadow(color: .white.opacity(0.5), radius: 1, x: 2, y: 2)
                
                Text(player.name)
                    .font(.title.bold())
                    .shadow(color: .white.opacity(0.7), radius: 1, x: 1, y: 1)
                    .shadow(color: .white.opacity(0.5), radius: 1, x: 2, y: 2)
                    
                VStack(alignment: .leading ,spacing: 6){
                    Text("場均得分 : \(player.PTS ,specifier: "%.1f")")
                        .font(.title2.bold())
                        .foregroundColor(.white)
                        .shadow(color: .black.opacity(0.7), radius: 1, x: 1, y: 1)
                        .shadow(color: .black.opacity(0.3), radius: 0.7, x: 2, y: 2)
                    
                    Text("投籃命中率 : \(player.FG ,specifier: "%.1f")")
                        .font(.title2.bold())
                        .foregroundColor(.white)
                        .shadow(color: .black.opacity(0.7), radius: 1, x: 1, y: 1)
                        .shadow(color: .black.opacity(0.3), radius: 0.7, x: 2, y: 2)
                    
                    Text("3分命中率: \(player.point3 ,specifier: "%.1f")")
                        .font(.title2.bold())
                        .foregroundColor(.white)
                        .shadow(color: .black.opacity(0.7), radius: 1, x: 1, y: 1)
                        .shadow(color: .black.opacity(0.3), radius: 0.7, x: 2, y: 2)
                }
                .padding(.leading ,15)
            }
            .offset(x: -30 ,y: -35)
            .frame(width: 300, height: 300)
            
        }
        .background(
            Image(player.teamImage)
                .resizable()
                .scaledToFit()
                .opacity(0.45)
                .frame(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height)
        )
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView(player:  PlayerModel(name: "Stephen Curry", imageName: "StephenCurry", PTS: 24.3, point3: 43.3, FG: 47.3, teamImage: "Warriors"))
    }
}
