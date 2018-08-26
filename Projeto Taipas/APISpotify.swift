//
//  APISpotify.swift
//  Projeto Taipas
//
//  Created by Bruno Rocca on 25/08/2018.
//  Copyright © 2018 Bruno Rocca. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APISpotify{
    
    typealias JSONStandard = [String : AnyObject]
    
    //constants that we got from spotify api project to get access token to make requests
    private let clientID = "dd6fc05e17654f07933f07d8602d7845"
    private let clientSecret = "da1e132fa2644d498fc75a0827c72e8a"
    var token: String?
    
    var urlRequest: String?
    
    
    
    func getAccessToken(completion: @escaping () -> ()){
            //parameters of spotify project to get the token
            let parameters = ["client_id" : clientID,
                              "client_secret" : clientSecret,
                              "grant_type" : "client_credentials"]
            
            //making request with alamofire to get token
            Alamofire.request("https://accounts.spotify.com/api/token", method: .post, parameters: parameters).responseJSON(completionHandler: { response in
                let tokenResult = response.value as? [String: Any]
                self.token = tokenResult!["access_token"]! as? String
                completion()
            })
        
    }
    func getURL(artist: String, type: String, limit: Int, offset: Int){
        var artistDecoded = ""
        for char in artist{
            if (char != " "){
                artistDecoded.append(char)
            }
            else{
                artistDecoded += "%20"
            }
            //print("char: ",char)
        }
        print(artistDecoded)
        
        let URL = "https://api.spotify.com/v1/search?q=" + artistDecoded + "&type=" + type + "&market=BR" + "&limit=\(limit)" + "&offset=\(offset)"
        
        
        print(URL)
        urlRequest = URL
        
    }
    func callAlamo(completion: @escaping (JSON) -> ()){
        let headers: HTTPHeaders = ["Authorization" : "Bearer " + token!]
        
        Alamofire.request(urlRequest!, headers: headers).responseData(completionHandler: {
            response in
            if let data = response.result.value{
                do{
                    let jsonResult = try JSON(data: data)
                    completion(jsonResult)
                    
                }catch{
                    print(error)
                }
            }
            
        })
    }
    
}
