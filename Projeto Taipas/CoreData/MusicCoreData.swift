//
//  MusicCoreData.swift
//  Projeto Taipas
//
//  Created by Bruno Rocca on 28/08/2018.
//  Copyright © 2018 Bruno Rocca. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class MusicCoreData{
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context: NSManagedObjectContext

    init(){
        self.context = appDelegate.persistentContainer.viewContext
    }
    
    func addMusic(_ music: Musica){
        //creating new object in the entity music
        let newMusic = NSEntityDescription.insertNewObject(forEntityName: "Music", into: context)
        
        newMusic.setValue(music.musicName, forKey: "musicName")
        newMusic.setValue(music.artist, forKey: "artist")
        newMusic.setValue(music.cover, forKey: "cover")
        newMusic.setValue(music.year, forKey: "year")
        
        //saving new data
        do{
            try context.save()
            print("New music added with sucess")
        }catch{
            print("ERROR: Can't save data of new music")
        }
        
    }
    func getAllMusics() -> [Musica]{
        let fetchRequest : NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Music")

        //creating list that will have all musics
        var musics: [Musica] = []
        
        do{
            //getting all information of the database
            let result = try context.fetch(fetchRequest)
            
            for i in 0..<result.count{
                let musicObject = result[i] as! NSManagedObject
                
                //creating and putting informations in music
                let music = Musica()
                
                music.musicName = musicObject.value(forKey: "musicName") as? String
                music.artist = musicObject.value(forKey: "artist") as? String
                music.cover = musicObject.value(forKey: "cover") as? String
                music.year = musicObject.value(forKey: "year") as? String
                
                musics.append(music)
            }
            
        }catch{
            print("ERROR: Can't load all musics")
        }
        
        return musics
    }
    
    func removeMusic(music: Musica){
        //
        let fetchRequest : NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Music")
        
        //
        fetchRequest.predicate = NSPredicate(format: "musicName == %@", music.musicName!)
        
        do{
            let result = try context.fetch(fetchRequest)
            //if theres more than 1 music with this name, wil
            print("tamanho de result: ", result.count)
            
            for i in 0..<result.count{
                let musicObject = result[i] as! NSManagedObject
                context.delete(musicObject)
            }
            
        }catch{
            print("ERROR: Can't find the music to be removed")
        }

        
        do{
            try context.save()
        }catch{
            print("ERROR: Can't save the data with the removed music")
        }
    }
    func removeAllMusics(){
        let delete = NSBatchDeleteRequest(fetchRequest: Music.fetchRequest())
        do{
            try context.execute(delete)
        }catch{
            print("ERROR: Can't delete data from music (2 instance)")
        }
    }
    
}
