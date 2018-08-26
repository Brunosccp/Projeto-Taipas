//
//  ViewController.swift
//  Projeto Taipas
//
//  Created by Bruno Rocca on 24/08/2018.
//  Copyright © 2018 Bruno Rocca. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class TableViewController: UITableViewController {

    let group = DispatchGroup()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let apiSpotify = APISpotify()
        
        //calling closure to get access token of spotify
        apiSpotify.getAccessToken(completion: {
            print(apiSpotify.token!)
            
            apiSpotify.getURL(artist: "camarote", type: "track", limit: 20, offset: 10)
            
            //calling closure to get info of URL
            apiSpotify.callAlamo(completion: {result in //result is the JSON
                
                for i in 0..<result["tracks"]["items"].count{
                    print(result["tracks"]["items"][i]["name"])
                    print(result["tracks"]["items"][i]["artists"][0]["name"])
                    print()
                }
                
            })
        })
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

