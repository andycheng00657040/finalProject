//
//  siteView.swift
//  finalHomework
//
//  Created by User08 on 2020/6/23.
//  Copyright © 2020 00657040. All rights reserved.
//

import Foundation
import SwiftUI
import CryptoKit

struct siteView: View {
    @State private var sites = [siteInfo]()
    @State private var likeScale: CGFloat = 1
    var body: some View {
        NavigationView {
            List(sites.indices, id: \.self) { (index)  in
                NavigationLink(destination: siteDetail(site: self.sites[index])) {
                   siteRow(site: self.sites[index])
                }
            }
            .onAppear {
                self.fetchSite()
            }
           .navigationBarTitle("桃園市ubike站點")
        }
    }
    
    func getTimeString() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "EEE, dd MMM yyyy HH:mm:ww zzz"
        dateFormater.locale = Locale(identifier: "en_US")
        dateFormater.timeZone = TimeZone(secondsFromGMT: 0)
        let time = dateFormater.string(from: Date())
        return time
    }
    func fetchSite(){
        let appId = "c586fd849c4b41dbbe97d2701230da4f"
        let appKey = "dAcKtF3nbg3S1uQOUtPcHczrM1k"
        let xdate = getTimeString()
        let signDate = "x-date: \(xdate)"
        let key = SymmetricKey(data: Data(appKey.utf8))
        let hmac = HMAC<SHA256>.authenticationCode(for: Data(signDate.utf8), using: key)
        let base64HmacString = Data(hmac).base64EncodedString()
        let authorization = """
        hmac username="\(appId)", algorithm="hmac-sha256", headers="x-date", signature="\(base64HmacString)"
        """
        let url = URL(string: "https://ptx.transportdata.tw/MOTC/v2/Bike/Station/Taoyuan?$top=100&$format=JSON")!
        var request = URLRequest(url: url)
        request.setValue(xdate, forHTTPHeaderField: "x-date")
        request.setValue(authorization, forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            let decoder = JSONDecoder()
            if let data = data, let cResults = try?
                decoder.decode([siteInfo].self, from: data) {
                self.sites.append(contentsOf: cResults)
            }
        }.resume()
    }
}
struct siteView_Previews: PreviewProvider {
    static var previews: some View {
        siteView()
    }
}
