//
//  TwoViewController.swift
//  Projeto Taipas
//
//  Created by Stefan V. de Moraes on 28/08/2018.
//  Copyright © 2018 Bruno Rocca. All rights reserved.
//

import UIKit

class TwoViewController: UIViewController {

    fileprivate var musicViewController: MusicViewController?
    fileprivate var webViewController: WebViewController?
    
    var masterSong = Musica()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        guard let webController = childViewControllers.first as? WebViewController else {
            fatalError("Check storyboard for missing MapViewController")
        }
        
        guard let musicController = childViewControllers.last as? MusicViewController else  {
            fatalError("Check storyboard for missing LocationTableViewController")
        }
        
        musicViewController = musicController
        webViewController = webController
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        if let musicController = destination as? MusicViewController {
            self.musicViewController = musicController
            self.musicViewController?.song = self.masterSong
        }
        
        if let webController = destination as? WebViewController {
            self.webViewController = webController
             self.webViewController?.song = self.masterSong
        }
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
