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
import WebKit

class MusicViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var webCover: WKWebView!
    
    @IBOutlet weak var music: UILabel!
    @IBOutlet weak var artist: UILabel!
    
    @IBOutlet weak var year: UILabel!
    
    var song = Musica()
    
    override func loadView() {
        //let webConfiguration = WKWebViewConfiguration()
        webCover = WKWebView()
        webCover.navigationDelegate = self
        view = webCover
    }

    override func viewWillAppear(_ animated: Bool) {

//        artist.text = song.artist
//        year.text = song.year
//        music.text = song.musicName
    }

    let group = DispatchGroup()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let myURL = URL(string: "https://i.scdn.co/image/fd6fbb74ff13e324092ba77fd56fcc7e20551b84")
        let myRequest = URLRequest(url: myURL!)
        webCover.load(myRequest)
        webCover.allowsBackForwardNavigationGestures = true
        
        let apiSpotify = APISpotify()
        
        //calling closure to get access token of spotify
        apiSpotify.getAccessToken(completion: {
            print(apiSpotify.token!)
            
            apiSpotify.getURL(search: "turma do pagode", type: "track", limit: 20, offset: 10)
            
            //calling closure to get info of URL
            apiSpotify.callAlamo(completion: {result in //result is the JSON
                
                for i in 0..<result["tracks"]["items"].count{
                    print(result["tracks"]["items"][i]["name"]) //nome da musica
                    print(result["tracks"]["items"][i]["album"]["release_date"]) //data de lançamento da musica
                    print(result["tracks"]["items"][i]["artists"][0]["name"])   //nome do artista/banda
                    print(result["tracks"]["items"][i]["popularity"])   //popularidade da musica
                    print(result["tracks"]["items"][i]["album"]["images"][0]["url"])    //url da imagem do album
                    print()
                }
                
            })
        })
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


} //END MusicViewController


