//
//  MusicVideo.swift
//  MusicVideo
//
//  Created by Will Fuger on 5/21/16.
//  Copyright © 2016 boogiesquad. All rights reserved.
//

import Foundation

class Videos {
    
    private var _vName: String
    private var _vRights: String // Need to initialize
    private var _vPrice: String // Need to initialize
    private var _vImageUrl: String
    private var _vArtist: String // Need to initialize
    private var _vVideoUrl: String
    private var _vImid: String // Need to initialize
    private var _vGenre: String // Need to initialize
    private var _vLinkToiTunes: String // Need to initialize
    private var _vReleaseDte: String // Need to initialize
    
    
    var vName: String {
        return _vName
    }
    
    var vRights: String {
        return _vRights
    }
    
    var vPrice: String {
        return _vPrice
    }
    
    var vImageUrl: String {
        return _vImageUrl
    }
    
    var vArtist: String {
        return _vArtist
    }
    
    var vVideoUrl: String {
        return _vVideoUrl
    }
    
    var vImid: String {
        return _vImid
    }
    
    var vGenre: String {
        return _vGenre
    }
    
    var vLinkToiTunes: String {
        return _vLinkToiTunes
    }
    
    var vReleaseDte: String {
        return _vReleaseDte
    }
    
    
    init(data: JSONDictionary) {
        
        if let name = data["im:name"] as? JSONDictionary,
            vName = name["label"] as? String {
                self._vName = vName
        }
        else
        {
            _vName = ""
        }
        
        if let rights = data["rights"] as? JSONDictionary,
            vRights = rights["label"] as? String {
                self._vRights = vRights
        }
        else
        {
            _vRights = ""
        }
        
        if let price = data["im:price"] as? JSONDictionary,
            vPrice = price["label"]  as? String {
                self._vPrice = vPrice
        }
        else
        {
            _vPrice = ""
        }
        
        if let img = data["im:image"] as? JSONArray,
            image = img[2] as? JSONDictionary,
            immage = image["label"] as? String {
                _vImageUrl = immage.stringByReplacingOccurrencesOfString("100x100",
                                 withString: "600x600")
        }
            else
        {
            _vImageUrl = ""
        }
        
        if let artist = data["im:artist"] as? JSONDictionary,
            vArtist = artist["label"] as? String {
                self._vArtist = vArtist
        }
        else
        {
            _vArtist = ""
        }
        
        if let video = data["link"] as? JSONArray,
            vUrl = video[1] as? JSONDictionary,
            vHref = vUrl["attributes"] as? JSONDictionary,
            vVideoUrl = vHref["href"] as? String {
                self._vVideoUrl = vVideoUrl
        }
        else
        {
            _vVideoUrl = ""
        }
        
        if let imid = data["id"] as? JSONDictionary,
            vImid = imid["label"] as? String {
                self._vImid = vImid
        }
        else
        {
            _vImid = ""
        }
        
        if let genre = data["category"] as? JSONDictionary,
            Genre = genre["attributes"] as? JSONDictionary,
            vGenre = Genre["label"] as? String {
            self._vGenre = vGenre
        }
        else
        {
            _vGenre = ""
        }
        
        if let linkToiTunes = data["link"] as? JSONArray,
            link2iTunes = linkToiTunes[0] as? JSONDictionary,
            vLink2iTunes = link2iTunes["href"] as? String {
                _vLinkToiTunes = vLink2iTunes
        }
        else
        {
            _vLinkToiTunes = ""
        }
        
        if let releaseDate = data["im:releaseDate"] as? JSONDictionary,
            vReleaseDte = releaseDate["label"] as? String {
                self._vReleaseDte = vReleaseDte
        }
        else
        {
            _vReleaseDte = ""
        }
        
        
    }
    
}