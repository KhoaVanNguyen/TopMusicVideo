//
//  MusicVideo.swift
//  TopMusicVideo
//
//  Created by Khoa on 8/27/16.
//  Copyright © 2016 Khoa. All rights reserved.
//

import Foundation

class MusicVideo{
    private var _vName : String
    private var _vImage : String
    private var _vUrl : String
    private var _vRights : String
    private var _vPrice : String
    private var _vArtist : String
    private var _vID : String
    private var _vGenre : String
    private var _vLinkToItunes : String
    private var _vReleaseDate : String
    
    
    var vReleaseDate : String{
        return _vReleaseDate
    }
    var vLinkToItunes : String{
        return _vLinkToItunes
    }
    var vGenre : String{
        return _vGenre
    }
    var vID : String {
        return _vID
    }
    var  vArtist : String{
        return _vArtist
    }
    var vPrice : String{
        return _vPrice
    }
    var vRights : String{
        return _vRights
    }
    var vName : String{
        return _vName
    }
    var vImage : String{
        return _vImage
    }
    var vUrl : String{
        return _vUrl
    }
    init(data : JSONDICTIONARY){
        if let name = data["im:name"]as? JSONDICTIONARY ,
            let label = name["label"]  as? String{
                self._vName = label
            }
        else{
            self._vName = ""
        }
        if let image = data["im:image"] as? JSONARRAY
            , let label = image[0]["label"] as? String{
                self._vImage = label.replacingOccurrences(of: "71x53", with: "1200x1200")
            }
        else{
            self._vImage = ""
        }
        if let link = data["link"] as? JSONARRAY ,
             let attributes = link[1]["attributes"] as? JSONDICTIONARY,
                 let href = attributes["href"] as? String {
                    self._vUrl = href
                }
        else{
            self._vUrl = ""
        }
        if let rights = data["rights"] as? JSONDICTIONARY ,
             let label = rights["label"] as? String{
                self._vRights = label
            }
        else{
            self._vRights = ""
        }
        if let price = data["im:price"] as? JSONDICTIONARY
            , let vprice = price["attributes"] as? JSONDICTIONARY
                , let amount = vprice["amount"] as? String{
                    self._vPrice = amount
        }
        else {
            self._vPrice = ""
        }
        if let artist = data["im:artist"] as? JSONDICTIONARY ,
             let label = artist["label"] as? String{
                self._vArtist = label
        }
        else {
            self._vArtist = ""
        }
        if let category = data["category"] as? JSONDICTIONARY
            , let attributes = category["attributes"] as? JSONDICTIONARY ,
                 let term = attributes["term"] as? String{
                    self._vGenre = term
        }
        else {
            self._vGenre = ""
        }
        if let releaseDate = data["im:releaseDate"] as? JSONDICTIONARY ,
             let attributes = releaseDate["attributes"] as? JSONDICTIONARY ,
                 let label = attributes["label"] as? String{
                    self._vReleaseDate = label
        }
        else {
            self._vReleaseDate = ""
        }
        if let LinkToItunes = data["link"] as? JSONARRAY ,
             let attributes = LinkToItunes[0]["attributes"] as? JSONDICTIONARY ,
                 let href = attributes["href"] as? String {
                    self._vLinkToItunes = href
                }
        else{
            self._vLinkToItunes = ""
        }
        if let id = data["id"] as? JSONDICTIONARY ,
             let attributes = id["attributes"] as? JSONDICTIONARY ,
                 let imID = attributes["im:id"] as? String{
                    self._vID = imID
                }
        else {
            self._vID = ""
        }
    }
    
}
