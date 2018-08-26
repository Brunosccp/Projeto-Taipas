//
//  APISpotify.swift
//  Projeto Taipas
//
//  Created by Bruno Rocca on 25/08/2018.
//  Copyright © 2018 Bruno Rocca. All rights reserved.
//

import Foundation
import Alamofire


class APISpotify{
    
    typealias JSONStandard = [String : AnyObject]
    
    private let clientID = "dd6fc05e17654f07933f07d8602d7845"
    private let clientSecret = "da1e132fa2644d498fc75a0827c72e8a"
    var token: String?
    
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
    func callAlamo(url: String, completion: @escaping () -> ()){
        let headers: HTTPHeaders = ["Authorization" : "Bearer " + token!]
        
        Alamofire.request(url, headers: headers).responseJSON(completionHandler: {
            response in
            //let bob = response.data as! [String : Any]
            self.parseData(JSONData: response.data!)
            //print(bob)
            
        })
    }
    func parseData(JSONData: Data){
        
        //let item
        
    
    }
                
                
            
            
            
            
            
            
        }catch{
            print(error)
        }
        
        
    }
    
}
