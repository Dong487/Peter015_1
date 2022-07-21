//
//  HomeView.swift
//  Peter015_1
//
//  Created by DONG SHENG on 2022/7/21.
//

import SwiftUI

// 皆為生涯平均
struct PlayerModel: Hashable{
    let name: String
    let imageName: String
    let PTS: Double    // 場均得分
    let point3: Double // 3分球命中率(百分比)
    let FG: Double     // 投籃命中率(百分比)
    let teamImage: String 
}

class HomeViewModel: ObservableObject{
    
    @Published var player: [PlayerModel] = [
        PlayerModel(name: "Michael Jordan", imageName: "MichaelJordan", PTS: 30.1, point3: 33.2, FG: 49.7, teamImage: "Bulls"),
        PlayerModel(name: "Kobe Bryant", imageName: "KobeBryant", PTS: 26, point3: 32.9, FG: 44.7, teamImage: "Lakers"),
        PlayerModel(name: "LeBron James", imageName: "LeBronJames", PTS: 27.0, point3: 31.9, FG: 50.4, teamImage: "Cleveland"),
        PlayerModel(name: "Stephen Curry", imageName: "StephenCurry", PTS: 24.3, point3: 43.3, FG: 47.3, teamImage: "Warriors")
    ]
}

struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            List{
                ForEach(viewModel.player ,id: \.self){ index in
                    
                    NavigationLink {
                        SecondView(player: index)
                    } label: {
                        HStack(spacing: 15){
                            Image(index.imageName)
                                .resizable()
                                .clipShape(Circle())
                                .frame(width: 90, height: 90)
                            
                            Text(index.name)
                                .font(.title)
                        }
                    }
                }
            }
            .navigationBarTitle("NBA")
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
