//
//  ProgrammePersistence.swift
//  ProgrammeSportif
//
//  Created by if26-grp1 on 12/12/2017.
//  Copyright © 2017 MougneMarcellin. All rights reserved.
//

import Foundation
import SQLite

class ProgrammePersistence{
    
    let programmesTable = Table("programmes")
    let id = Expression<Int>("id")
    let titre = Expression<String>("titre")
    let type = Expression<String>("type") //Cast à partir de l'enum TypeProgramme
    let dateCreation = Expression<TimeInterval>("dateCreation")
    
    let activites = Table("activites")
    let programme_id = Expression<Int>("programme_id")
    
    init(){
        ConnexionBD.connexion()
    }
    
    
    func createTable(){
        let createTable = self.programmesTable.create { (table) in
            table.column(self.id, primaryKey: true)
            table.column(self.titre)
            table.column(self.type)
            table.column(self.dateCreation)
        }
        
        do {
            try ConnexionBD.database.run(createTable)
            print("Table programmes creee")
        } catch {
            print(error)
        }
    }
    
    func insertProgramme(titre: String, type: TypeProgramme) {
        do {
            let encryptedTitre = try ConnexionBD.encryptMessage(message: titre)
            let encryptedType = try ConnexionBD.encryptMessage(message: type.rawValue)
    
            let insertProgramme = self.programmesTable.insert(self.titre <- encryptedTitre, self.type <- encryptedType, self.dateCreation <- NSDate().timeIntervalSince1970)
            
            try ConnexionBD.database.run(insertProgramme)
            print("Programme insere")
        } catch {
            print(error)
        }
    }
    
    func listProgrammes() {
        do {
            let programmes = try ConnexionBD.database.prepare(self.programmesTable)
            for programme in programmes {
                
                let decryptedTitre = try ConnexionBD.decryptMessage(encryptedMessage: programme[self.titre])
                let decryptedType = try ConnexionBD.decryptMessage(encryptedMessage: programme[self.type])
                
                let date = NSDate(timeIntervalSince1970: TimeInterval(programme[self.dateCreation]))
                print("programmeId: \(programme[self.id]), titre: \(decryptedTitre), type: \(decryptedType), dateCreation: \(date)")
            }
        } catch {
            print(error)
        }
    }
    
    func getProgrammes() -> Array<Programme>! {
        var allProgrammes = [Programme]()
        var tempProgramme : Programme
        
        do {
            let programmes = try ConnexionBD.database.prepare(self.programmesTable)
            for programme in programmes {
                
                let decryptedTitre = try ConnexionBD.decryptMessage(encryptedMessage: programme[self.titre])
                let decryptedType = try ConnexionBD.decryptMessage(encryptedMessage: programme[self.type])
                
                let date = NSDate(timeIntervalSince1970: TimeInterval(programme[self.dateCreation]))
                var type = TypeProgramme(rawValue : decryptedType)!
                
                tempProgramme = Programme(id: programme[self.id], titre: decryptedTitre, type: type, dateCreation: date)
                allProgrammes.append(tempProgramme)
            }
            return allProgrammes
        } catch {
            print(error)
            return nil
        }
    }
       
    
    func deleteProgramme(id : Int) {
        let programme = self.programmesTable.filter(self.id == id)
        let deleteProgramme = programme.delete()
        do {
            try ConnexionBD.database.run(deleteProgramme)
            print("Programme \(id) supprime")
        } catch {
            print(error)
        }
    }
    
    func deleteTable(){
        do {
            try ConnexionBD.database.run(programmesTable.drop())
            print("Table programmes supprimee")
        } catch {
            print(error)
        }
    }
    
    
    
    
    
}

