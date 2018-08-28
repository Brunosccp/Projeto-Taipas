//
//  WebViewController.swift
//  Projeto Taipas
//
//  Created by Stefan V. de Moraes on 28/08/2018.
//  Copyright © 2018 Bruno Rocca. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webCover: WKWebView!
    var song = Musica()
    
    override func loadView() {
        
        webCover = WKWebView()
        webCover.navigationDelegate = self
        view = webCover
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string: song.cover!)
        let myRequest = URLRequest(url: myURL!)
        webCover.load(myRequest)
        webCover.allowsBackForwardNavigationGestures = true
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
