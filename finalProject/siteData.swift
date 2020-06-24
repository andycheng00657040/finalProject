//
//  siteData.swift
//  finalProject
//
//  Created by User08 on 2020/6/24.
//  Copyright © 2020 00657040. All rights reserved.
//

import Foundation
import CryptoKit
import Combine

class siteData: ObservableObject {
    @Published var SiteInfo = [siteInfo]()
    
    func getTimeString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, dd MMM yyyy HH:mm:ww zzz"
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        let time = dateFormatter.string(from: Date())
        return time
    }
    
    func fetchSite(){
        let query = "https://ptx.transportdata.tw/MOTC/v2/Bike/Station/Taoyuan?$top=100&$format=JSON"
        if let urlStr = query.addingPercentEncoding(withAllowedCharacters:
            .urlQueryAllowed){
            if let url = URL(string: urlStr) {
                let appID = "c586fd849c4b41dbbe97d2701230da4f"
                let appKey = "dAcKtF3nbg3S1uQOUtPcHczrM1k"
                let xdate = getTimeString()
                let signDate = "x-date: \(xdate)"
                let key = SymmetricKey(data: Data(appKey.utf8))
                let hmac = HMAC<SHA256>.authenticationCode(for: Data(signDate.utf8), using: key)
                let base64HmacString = Data(hmac).base64EncodedString()
                let authorization = """
                hmac username="\(appID)", algorithm="hmac-sha256", headers="x-date", signature="\(base64HmacString)"
                """
                var request = URLRequest(url: url)
                request.setValue(xdate, forHTTPHeaderField: "x-date")
                request.setValue(authorization, forHTTPHeaderField: "Authorization")
                request.setValue("gzip", forHTTPHeaderField: "Accept-Encoding")
                URLSession.shared.dataTask(with: request) { (data, response, error) in
                    let decoder = JSONDecoder()
                    if let data = data, let siteResults = try? decoder.decode([siteInfo].self, from: data) {
                        self.SiteInfo = siteResults
                    }
                    else{
                        print("error")
                    }
                }.resume()
            }
        }
        
    }
}
