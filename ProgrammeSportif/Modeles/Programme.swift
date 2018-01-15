//
//  Programme.swift
//  ProgrammeSportif
//
//  Created by if26-grp1 on 12/12/2017.
//  Copyright © 2017 MougneMarcellin. All rights reserved.
//

import Foundation

class Programme {
    var id: Int
    var titre: String
    var type: TypeProgramme
    var dateCreation: NSDate
    var listeActivite: Array<Activite>
    
    init(id: Int, titre: String, type: TypeProgramme, dateCreation: NSDate){
        self.id = id
        self.titre = titre
        self.type = type
        self.dateCreation = dateCreation
        listeActivite = Array<Activite>()
    }
    
    func getId() -> Int
    {
        return self.id
    }
    
    func getTitre() -> String
    {
        return self.titre
    }
    
    func getType() -> TypeProgramme
    {
        return self.type
    }
    
    func getDateCreation() -> NSDate
    {
        return self.dateCreation
    }
    
    func getListeActivite() -> Array<Activite>
    {
        return self.listeActivite
    }
    
    
    func setId(id : Int)
    {
        self.id = id
    }
    
    func setTitre(titre : String)
    {
        self.titre = titre
    }
    
    func setType(type : TypeProgramme)
    {
        self.type = type
    }
    
    func setDateCreation(dateCreation : NSDate)
    {
        self.dateCreation = dateCreation
    }
    
    func setListeActivite(listeActivite : Array<Activite>)
    {
        self.listeActivite = listeActivite
    }
    
    func ajouterActivite(activite: Activite)
    {
        self.listeActivite.append(activite)
    }
    
 
        


}


