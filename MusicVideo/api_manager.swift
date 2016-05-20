//
//  api_manager.swift
//  MusicVideo
//
//  Created by Will Fuger on 5/18/16.
//  Copyright © 2016 boogiesquad. All rights reserved.
//

import Foundation

class APIManager {
    
    func loadData(urlString:String, completion: (result:String) -> Void) {
        
        let session = NSURLSession.sharedSession()
        let url = NSURL(string: urlString)!
        
        let task = session.dataTaskWithURL(url) {
            (data, response, error) -> Void in
            
                if error != nil {
                    dispatch_async(dispatch_get_main_queue()) {
                        completion(result: (error!.localizedDescription))
                    }
                } else {
//                    if let data = data {
//                        print(data)
//                    }
                    do {
                        if let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
                            as? [String: AnyObject] {
                        print(json)
                        
                        let priority = DISPATCH_QUEUE_PRIORITY_HIGH
                        dispatch_async(dispatch_get_global_queue(priority, 0)) {
                            dispatch_async(dispatch_get_main_queue()) {
                                completion(result: "JSONSerialization Successful")
                            }
                        }
                    }
                } catch {
                    dispatch_async(dispatch_get_main_queue()) {
                        completion(result: "Error in NSJONSerialization")
                    }
                }
            }
        }
        task.resume()
    }
}