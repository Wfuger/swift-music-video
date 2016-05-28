//
//  api_manager.swift
//  MusicVideo
//
//  Created by Will Fuger on 5/18/16.
//  Copyright © 2016 boogiesquad. All rights reserved.
//

import Foundation

class APIManager {
    
    func loadData( urlString : String, completion : [Videos] -> Void ) {
        
        let config = NSURLSessionConfiguration.ephemeralSessionConfiguration()
        
        let session = NSURLSession( configuration: config )
    

        let url = NSURL( string : urlString )!
        
        let task = session.dataTaskWithURL( url ) {
            (data, response, error) -> Void in
            
                if error != nil {
                    
                        print( error!.localizedDescription )
                    
                } else {
                        do {
                            if let json = try NSJSONSerialization.JSONObjectWithData( data!, options : .AllowFragments )
                                as? JSONDictionary,
                                feed = json["feed"] as? JSONDictionary,
                                entries = feed["entry"] as? JSONArray {
                                
                                    var videos = [Videos]()  //Initialized an array with our Videos class as each index
                                    for entry in entries {
                                        let entry = Videos(data: entry as! JSONDictionary)
                                        videos.append(entry)
                                    }
                                
                                let i = videos.count
                                print("iTunesApiManage - total count --> \(i)")
                                print(" ")
                                    //print( json )
                        
                                    let priority = DISPATCH_QUEUE_PRIORITY_HIGH
                                    dispatch_async( dispatch_get_global_queue( priority, 0 ) ) {
                                        dispatch_async( dispatch_get_main_queue() ) {
                                            completion( videos )
                                        }
                                    }
                                }
                        } catch {
                            print("error in NSJSONSerialization")
                        }
                }
        }
        task.resume()
    }
}