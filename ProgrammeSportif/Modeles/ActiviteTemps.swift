//
//  ActiviteTemps.swift
//  ProgrammeSportif
//
//  Created by if26-grp1 on 12/12/2017.
//  Copyright © 2017 MougneMarcellin. All rights reserved.
//

import Foundation

class ActiviteTemps:Activite {
    
    var temps: Int // nombre de temps en secondes
    
    init(id: Int, programme_id : Int, titre:String, temps: Int){
        self.temps = temps
        super.init(id:id, programme_id: programme_id, titre:titre)
    }
    
    func getTemps() -> Int
    {
        return self.temps
        
    }
 
    func setTemps(temps : Int)
    {
        self.temps = temps
    }
    
    
    
}
