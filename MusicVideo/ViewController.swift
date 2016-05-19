//
//  ViewController.swift
//  MusicVideo
//
//  Created by Will Fuger on 5/18/16.
//  Copyright © 2016 boogiesquad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Call Api
        let api = APIManager()
        api.loadData("https://itunes.apple.com/us/rss/topmusicvideos/limit=10/json",
                     completion: didLoadData)
    }
    
    func didLoadData(result:String) {
        print(result)
    }
    
    
}

