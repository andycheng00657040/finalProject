//
//  ContentView.swift
//  finalHomework
//
//  Created by User08 on 2020/6/23.
//  Copyright © 2020 00657040. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            siteView()
                .tabItem{
                    Image(systemName:"photo")
                    Text("ubike站點")
            }
            ubikeView()
                .tabItem{
                    Image(systemName:"house.fill")
                    Text("查看車輛／空位")
            }
            videoView()
                .tabItem{
                    Image(systemName: "video")
                    Text("ubike相關影片")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
