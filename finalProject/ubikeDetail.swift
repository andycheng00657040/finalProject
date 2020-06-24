//
//  ubikeDetail.swift
//  finalHomework
//
//  Created by User08 on 2020/6/23.
//  Copyright © 2020 00657040. All rights reserved.
//

import SwiftUI

struct ubikeDetail: View {
    var bike: ubikeInfo
    var body: some View {
        ZStack{
           Image("859036")
           .resizable()
           VStack {
           
            HStack{
            Text("ubike剩餘車輛數：")
            .font(.system(size: 30))
            .fontWeight(.black)
            .background(Color.pink)
            .foregroundColor(.white)
            .cornerRadius(10)
                Text("\(bike.AvailableRentBikes)")
                .foregroundColor(.black)
                .font(.system(size: 40))
            }
            HStack{
                Text(" ")
                .bold()
            }
            HStack{
            Text("ubike剩餘空位：")
                .font(.system(size: 30))
                .fontWeight(.black)
                .background(Color.yellow)
                .foregroundColor(.red)
                .cornerRadius(10)
                Text("\(bike.AvailableReturnBikes)")
                .bold()
                .foregroundColor(.black)
                .font(.system(size: 40))
            }
            }
             
        }
    }
}

