//
//  ubikeRow.swift
//  finalHomework
//
//  Created by User08 on 2020/6/23.
//  Copyright © 2020 00657040. All rights reserved.
//

import SwiftUI

struct ubikeRow: View {
    var bike: ubikeInfo
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(bike.StationUID)
                    .bold()
                    .font(.system(size: 40))
                
            }
        }
    }
}
