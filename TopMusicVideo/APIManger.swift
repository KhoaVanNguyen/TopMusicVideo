//
//  APIManger.swift
//  TopMusicVideo
//
//  Created by Khoa on 8/26/16.
//  Copyright © 2016 Khoa. All rights reserved.
//

import Foundation
import UIKit
class APIManger{
    func loadData(url : String, completion : (result : [MusicVideo]) -> () ){
        let config = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: config)
        let url = URL(string: url)
        
        let task  = session.dataTask(with: url!){
            ( data, resonse, error) in
           
                if error != nil{
                   print(error?.localizedDescription)
                    }
                else{
                    var videos = [MusicVideo]()
                    DispatchQueue.global().async {
                        do {
                        
                       
                        if let json =  try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? JSONDICTIONARY,
                            let feed = json["feed"] as? JSONDICTIONARY,
                            let entries = feed["entry"] as? JSONARRAY{
                            for entry in entries{
                                let video = MusicVideo(data: entry)
                                videos.append(video)
                                print(video.vName)
                            }
                           
                        }
                    } catch{
                            print(error.localizedDescription)
                            }
                    }
                     completion(result: videos)
                    
            }
    }
        task.resume()
}
}
