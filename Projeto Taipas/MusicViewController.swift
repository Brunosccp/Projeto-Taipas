//
//  ViewController.swift
//  Projeto Taipas
//
//  Created by Bruno Rocca on 24/08/2018.
//  Copyright © 2018 Bruno Rocca. All rights reserved.
//

import UIKit

class MusicViewController: UIViewController {
    
    var music = Musica()

    override func viewWillAppear(_ animated: Bool) {
        
        equipModelo.text = academyEquip.modelo
        equipStatus.text = academyEquip.status
        equipBarcode.text = academyEquip.barcode
        setImage(modelo: academyEquip.modelo!)
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

