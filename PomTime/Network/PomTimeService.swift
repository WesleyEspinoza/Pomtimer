//
//  PomTimeService.swift
//  PomTime
//
//  Created by Wesley Espinoza on 2/23/19.
//  Copyright © 2019 ErespiStudios. All rights reserved.
//

import Foundation
import UIKit

struct NetworkManager {
    static let accessKey = "fdcad8790d6b218e9d9576769c942246147c53968c88a3014f1a7b6d261d4497"
    
//    typealias CompletionHandler = (_ success:Bool, _ data:ImageOfTheDay) -> Void
//
//    static func fetchImageData(completionHandler: @escaping CompletionHandler){
//
//        let session = URLSession(configuration: .default)
//        let jsonURL = "https://api.unsplash.com/photos/?client_id=\(accessKey)"
//        let request = URLRequest(url: URL(string: jsonURL)!)
//        session.dataTask(with: request) { (data, res, err) in
//
//            if let data = data {
//
//                var flag = true // true if download succeed,false otherwise
//
//                if err == nil {
//                    flag = true
//                } else {
//                    flag = false
//                }
//                do {
//                    let imageData = try JSONDecoder().decode([String: ImageOfTheDay].self, from: data)
//                    DispatchQueue.main.async {
//                       // print(imageData.regular)
//                        //completionHandler(flag, imageData)
//                    }
//                } catch {
//                    print("Error is : \n\(error)")
//                }
//            }
//
//            }.resume()
//    }
}
