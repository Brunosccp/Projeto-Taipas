//
//  ViewController.swift
//  Projeto Taipas
//
//  Created by Bruno Rocca on 24/08/2018.
//  Copyright © 2018 Bruno Rocca. All rights reserved.
//

import UIKit
import Alamofire

class TableViewController: UITableViewController {

    let group = DispatchGroup()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let apiSpotify = APISpotify()
        
        //calling closure to get access token of spotify
        apiSpotify.getAccessToken(completion: {
            print(apiSpotify.token!)
            
            //calling closure to get info of URL
            apiSpotify.callAlamo(url: "https://api.spotify.com/v1/search?q=Shawn%20Mendes&type=track&limit=20&offset=10", completion: {
                
                
            })
        })
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

