//
//  SearchTableViewController.swift
//  Projeto Taipas
//
//  Created by Stefan V. de Moraes on 27/08/2018.
//  Copyright © 2018 Bruno Rocca. All rights reserved.
//

import UIKit
import CoreData

class SearchTableViewController: UITableViewController {
    
    let searchController = UISearchController(searchResultsController: nil)

    var musicaList = [Musica]()
    var selectedMusic: Musica?
    var apiSpotify = APISpotify()
    var searchTxt: String!
    
    override func viewWillAppear(_ animated: Bool) {
        //self.musicaList.removeAll()
        self.searchController.searchBar.delegate = self
        self.searchController.dimsBackgroundDuringPresentation = false
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.searchBar.placeholder = "Enter your music or artist..."
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        self.searchTxt = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       ApiRefresh()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func ApiRefresh() {
        //calling closure to get access token of spotify
        musicaList.removeAll()
        apiSpotify.getAccessToken(completion: {
            print(self.apiSpotify.token!)
            
            self.apiSpotify.getURL(search: self.searchTxt, type: "track", limit: 20, offset: 10)
            
            //calling closure to get info of URL
            self.apiSpotify.callAlamo(completion: {result in //result is the JSON
                
                for i in 0..<result["tracks"]["items"].count{
                    let exemplo = Musica()
                    
                    exemplo.musicName = result["tracks"]["items"][i]["name"].stringValue
                    print(result["tracks"]["items"][i]["name"]) //nome da musica
                    exemplo.year = result["tracks"]["items"][i]["album"]["release_date"].stringValue
                    print(result["tracks"]["items"][i]["album"]["release_date"]) //data de lançamento da musica
                    exemplo.artist = result["tracks"]["items"][i]["artists"][0]["name"].stringValue
                    print(result["tracks"]["items"][i]["artists"][0]["name"])   //nome do artista/banda
                    print(result["tracks"]["items"][i]["popularity"])   //popularidade da musica
                    print("wAQUI!!!!!")
                    
                    var urlString = result["tracks"]["items"][i]["album"]["images"][0]["url"].stringValue
                    let url = URL(fileURLWithPath: urlString)

                    do {
                        exemplo.cover = UIImage(data: try Data(contentsOf: url))
                    }catch {

                    }
                   // exemplo.cover = UIImage(data: data)//(named: "racaN")
                    print(result["tracks"]["items"][i]["album"]["images"][0]["url"])    //url da imagem do album
                    self.musicaList.append(exemplo)
                    print()
                }
                self.tableView.reloadData()
                
            })
        })
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
        
        //cell.coverImage.image = self.musicaList[index].cover!
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.selectedMusic = self.musicaList[indexPath.row]
        
        let alertPrompt = UIAlertController(title: self.selectedMusic?.artist, message: (self.selectedMusic?.musicName)! + " will be in your favorite List", preferredStyle: .actionSheet)
        let confirmAction = UIAlertAction(title: "Confirmar", style: UIAlertActionStyle.default, handler: { (action) -> Void in
            
            //TODO: Set selectedMusic into CoreData
        })
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: UIAlertActionStyle.cancel, handler: nil)
        
        alertPrompt.addAction(confirmAction)
        alertPrompt.addAction(cancelAction)
        
        present(alertPrompt, animated: true, completion: nil)
        
    }
    
    

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

} //END TableViewController

extension SearchTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // MARK: -  PRA NÃO DAR PAU NUNCA
        if let searchText = searchBar.text {
            self.searchTxt = searchText
            ApiRefresh()
        }
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
    }
}

