//
//  MusicVideoTableViewCell.swift
//  MusicVideo
//
//  Created by Will Fuger on 5/31/16.
//  Copyright © 2016 boogiesquad. All rights reserved.
//

import UIKit

class MusicVideoTableViewCell: UITableViewCell {
    
    var video: Videos? {
        didSet {
            updateCell()
        }
    }

    @IBOutlet weak var musicImage: UIImageView!
    
    @IBOutlet weak var rank: UILabel!
    
    @IBOutlet weak var musicTitle: UILabel!
    
    func updateCell() {
        print("butt stuff")
        print("\(video?.vName)")
        
        musicTitle.text = video?.vName
        rank.text = ("\(video!.vRank)")
        musicImage.image = UIImage(named: "sorry-image-not-available")
        
        
    }
    
}
