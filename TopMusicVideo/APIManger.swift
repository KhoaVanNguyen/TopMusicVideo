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
    
    func loadData(url : String, completion : (result : String) -> () ){
        
        
        let config = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: config)
        
        let url = URL(string: url)
        
        let task  = session.dataTask(with: url!){
            ( data, resonse, error) in
            DispatchQueue.main.async {
                if error != nil{
                        completion(result: error!.localizedDescription)
                    }
                else{
                        completion(result: "Successfully")
                        print("********************************************")
                        print(data)
                    }
            }
        }
        task.resume()
        
    }
}
