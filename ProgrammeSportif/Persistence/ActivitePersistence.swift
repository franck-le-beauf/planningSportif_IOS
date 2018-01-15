//
//  ActivitePersistence.swift
//  ProgrammeSportif
//
//  Created by if26-grp1 on 13/12/2017.
//  Copyright © 2017 MougneMarcellin. All rights reserved.
//

import Foundation
import SQLite


class ActivitePersistence {
    
    let activitesTable = Table("activites")
    let id = Expression<Int>("id")
    let programme_id = Expression<Int>("programme_id")
    let titre = Expression<String>("titre")
    let typeActivite = Expression<String>("typeActivite") //ActiviteTemps ou ActiviteRepetition
    let temps = Expression<Int>("temps")
    let serie = Expression<Int>("serie")
    let repetition = Expression<Int>("repetition")
    
    let programmes = ProgrammePersistence()
    
    init(){
        ConnexionBD.connexion()
    }
    
    
    func createTable(){
        let createTable = self.activitesTable.create { (table) in
            table.column(self.id, primaryKey: true)
            table.column(self.programme_id)
            table.column(self.titre)
            table.column(self.typeActivite)
            table.column(self.temps)
            table.column(self.serie)
            table.column(self.repetition)
            table.foreignKey(self.programme_id, references: programmes.programmesTable, programmes.id, delete: .setNull)
        }
        
        do {
            try ConnexionBD.database.run(createTable)
            print("Table activitees creee")
        } catch {
            print(error)
        }
    }
    
    func deleteTable(){
        do {
            try ConnexionBD.database.run(activitesTable.drop())
            print("Table activitees supprimee")
        } catch {
            print(error)
        }
    }
    
    func insertActivite(programme_id: Int, titre: String, typeActivite: String, temps: Int!, serie: Int!, repetition: Int!) {
        do {
            let encryptedTitre = try ConnexionBD.encryptMessage(message: titre)
            let encryptedTypeActivite = try ConnexionBD.encryptMessage(message: typeActivite)
            
            var insertedTemps: Int;var insertedSerie: Int;var insertedRepetition: Int
            
            if(temps == nil){
                insertedTemps = 0
            }else{
                insertedTemps = temps
            }
            if(serie == nil){
                insertedSerie = 0
            } else {
                insertedSerie = serie
            }
            if(repetition == nil){
                insertedRepetition = 0
            } else {
                insertedRepetition = repetition
            }
            
            let insertActivite = self.activitesTable.insert(self.programme_id <- programme_id, self.titre <- encryptedTitre, self.typeActivite <- encryptedTypeActivite, self.temps <- insertedTemps, self.serie <- insertedSerie, self.repetition <- insertedRepetition)
            
            try ConnexionBD.database.run(insertActivite)
            print("Activite insere")
        } catch {
            print(error)
        }
    }

    
    func listActivites() {
    do {
            let activites = try ConnexionBD.database.prepare(self.activitesTable)
            for activite in activites {
                
                let decryptedTitre = try ConnexionBD.decryptMessage(encryptedMessage: activite[self.titre])
                let decryptedTypeActivite = try ConnexionBD.decryptMessage(encryptedMessage: activite[self.typeActivite])
                

                print("activiteId: \(activite[self.id]) programmeId: \(activite[self.programme_id]), titre: \(decryptedTitre), type: \(decryptedTypeActivite), temps: \(activite[self.temps]), serie: \(activite[self.serie]), repetition: \(activite[self.repetition])")
            }
        } catch {
            print(error)
        }
    }
    
    func getActivites(programme_id : Int) -> Array<Activite>!{
        var allActivite = [Activite]()
        var tempActivite : Activite!
        
        do {
            let activites = try ConnexionBD.database.prepare(self.activitesTable.filter(self.programme_id == programme_id))
            for activite in activites {
             
                let decryptedTitre = try ConnexionBD.decryptMessage(encryptedMessage: activite[self.titre])
                let decryptedTypeActivite = try ConnexionBD.decryptMessage(encryptedMessage: activite[self.typeActivite])
                
                if(decryptedTypeActivite == "ActiviteTemps"){
                    tempActivite = ActiviteTemps(id: activite[self.id], programme_id: activite[self.programme_id], titre: decryptedTitre, temps: activite[self.temps])
                }
                else if(decryptedTypeActivite == "ActiviteRepetition"){
                    tempActivite = ActiviteRepetition(id: activite[self.id], programme_id: activite[self.programme_id], titre: decryptedTitre, repetition: activite[self.repetition], serie: activite[self.serie])
                }
                
                allActivite.append(tempActivite)
            }
            return allActivite
        } catch {
            print(error)
            return nil
        }
    }
    
    func getActivitesCount() -> Int! {
        do {
            return try ConnexionBD.database.scalar(activitesTable.count)
        } catch {
            print(error)
            return nil
        }
    }
    
    
    
    
    func deleteActivite(id : Int) {
        let activite = self.activitesTable.filter(self.id == id)
        let deleteProgramme = activite.delete()
        do {
            try ConnexionBD.database.run(deleteProgramme)
            print("Activite \(id) supprime")
        } catch {
            print(error)
        }
    }
    
    func deleteActivite(programme_id : Int) {
        let activite = self.activitesTable.filter(self.programme_id == programme_id)
        let deleteProgramme = activite.delete()
        do {
            try ConnexionBD.database.run(deleteProgramme)
            print("Activite du programme \(programme_id) supprimee(s)")
        } catch {
            print(error)
        }
    }
    
}
