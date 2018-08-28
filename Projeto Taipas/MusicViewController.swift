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
    
    @IBOutlet weak var musicTitle: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    
    
    
    var song = Musica()
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.artistName.text = song.artist
        self.releaseDate.text = song.year
        self.musicTitle.text = song.musicName

    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


} //END MusicViewController


