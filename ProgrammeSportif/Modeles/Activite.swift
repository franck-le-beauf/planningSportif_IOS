//
//  Activite.swift
//  ProgrammeSportif
//
//  Created by if26-grp1 on 12/12/2017.
//  Copyright © 2017 MougneMarcellin. All rights reserved.
//

import Foundation

class Activite {

    var id: Int
    var titre: String
    var programme_id: Int
    
    
    init(id: Int, programme_id: Int,titre: String){
        self.id = id
        self.titre = titre
        self.programme_id = programme_id
    }
    
    func getId() -> Int
    {
        return self.id
    }
    
    func getTitre() -> String
    {
        return self.titre
    }
    
    func setId(id : Int)
    {
        self.id = id
    }
    
    func setTitre(titre : String)
    {
        self.titre = titre
    }
    
    func setProgrammeId(programme_id : Int)
    {
        self.programme_id = programme_id
    }
    
    func getProgrammeId() -> Int
    {
        return self.programme_id
    }
    

    
    
    
    
    
}
