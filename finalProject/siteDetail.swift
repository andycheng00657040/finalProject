//
//  siteDetail.swift
//  finalHomework
//
//  Created by User08 on 2020/6/23.
//  Copyright © 2020 00657040. All rights reserved.
//

import SwiftUI

struct siteDetail: View {
    var site: siteInfo
    var body: some View {
        ZStack{
           Image("859036")
           .resizable()
           VStack {
           HStack() {
                Text(site.StationName.Zh_tw)
                    .font(.system(size: 40))
                    .fontWeight(.black)
                    .background(Color.yellow)
                    .foregroundColor(.green)
                    
            }
            HStack{
                Text(" ")
                .bold()
            }
            HStack{
                Text(site.StationAddress.Zh_tw)
                .bold()
                .background(Color.orange)
                .foregroundColor(.red)
                .cornerRadius(5)
            }
            HStack{
                Text(" ")
                .bold()
            }
            HStack{
                Text("站號：")
                .font(.system(size: 20))
                .fontWeight(.black)
                .background(Color.green)
                .foregroundColor(.gray)
                .cornerRadius(10)
                Text(site.StationUID)
                .bold()
                .fontWeight(.black)
                .background(Color.pink)
                .foregroundColor(.blue)
                .font(.system(size: 20))
            }
            HStack{
                Text(" ")
                .bold()
            }
            HStack{
                Text("ubike最大存放數量：")
                .font(.system(size: 30))
                .fontWeight(.black)
                .background(Color.yellow)
                .foregroundColor(.white)
                .cornerRadius(10)
                Text("\(site.BikesCapacity)")
                .bold()
                .foregroundColor(.black)
                .font(.system(size: 40))
            }
            }
             
        }
    }
}

struct siteDetail_Previews: PreviewProvider {
    static var previews: some View {
        siteDetail(site: siteInfo(StationUID: "TAO2001",StationName:NameType(Zh_tw: "中央大學圖書館", En: "National Central University Library"), BikesCapacity: 60, StationAddress: NameType(Zh_tw: "中大路300號(中央大學校內圖書館前)", En: "No.300, Zhongda Rd.")))
    }
}
