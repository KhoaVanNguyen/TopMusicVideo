//
//  ViewController.swift
//  TopMusicVideo
//
//  Created by Khoa on 8/26/16.
//  Copyright © 2016 Khoa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let apiManger = APIManger()
        apiManger.loadData(url: "https://itunes.apple.com/us/rss/topmusicvideos/limit=10/json", completion: didLoadData )
}
    func didLoadData(result : String) -> Void{
        
        let alert = UIAlertController(title: result, message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
}
