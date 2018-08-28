//
//  SearchTableViewController.swift
//  Projeto Taipas
//
//  Created by Stefan V. de Moraes on 27/08/2018.
//  Copyright © 2018 Bruno Rocca. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController {

    var musicaList = [Musica]()
    var selectedMusic: Musica?
    
    override func viewWillAppear(_ animated: Bool) {
        //self.musicaList.removeAll()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let exemplo = Musica()
        
        exemplo.artist = "Raça Negra"
        exemplo.musicName = "Ciúme de Você"
        exemplo.cover = UIImage(named: "racaN")
        exemplo.style = "Pagode"
        exemplo.year = "1993"
        
        let exemplo2 = Musica()
        
        exemplo2.artist = "Skank"
        exemplo2.musicName = "Resposta"
        exemplo2.cover = UIImage(named: "racaN")
        exemplo2.style = "Pop/Rock"
        exemplo2.year = "2001"
        
        self.musicaList.append(exemplo)
        
        self.tableView.reloadData()
        
        let music = MusicCoreData()
        //music.addMusic(exemplo)
        //music.addMusic(exemplo2)
        //music.removeAllMusics()
        
        print(music.getAllMusics().count)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.musicaList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as! SearchTableViewCell
        
        let index = indexPath.row
        
        // Configure the cell...
        
        cell.musicLabel.text = self.musicaList[index].musicName!
        
        cell.artistLabel.text = self.musicaList[index].artist!
        
        cell.coverImage.image = self.musicaList[index].cover!
        
        
        return cell
    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
