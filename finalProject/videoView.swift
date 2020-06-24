//
//  vedioView.swift
//  finalHomework
//
//  Created by User08 on 2020/6/23.
//  Copyright © 2020 00657040. All rights reserved.
//

import SwiftUI

struct videoView: View {
    @State private var urlString = "https://www.youtube.com/watch?v=7OOrJESdggk"
    var body: some View {
        VStack {
            webView(urlString: urlString)
        }
    }
}

struct videoView_Previews: PreviewProvider {
    static var previews: some View {
        videoView()
    }
}
