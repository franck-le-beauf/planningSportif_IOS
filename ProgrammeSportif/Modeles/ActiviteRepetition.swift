
//
//  ActiviteRepetition.swift
//  ProgrammeSportif
//
//  Created by if26-grp1 on 12/12/2017.
//  Copyright © 2017 MougneMarcellin. All rights reserved.
//

import Foundation

class ActiviteRepetition:Activite {
    
    var repetition: Int // nombre de fois ou on reproduit le mouvement
    var serie: Int //Nb de fois ou le fait les repetitions
    
    init(id: Int, programme_id : Int,titre:String, repetition: Int, serie: Int){
        self.repetition = repetition
        self.serie = serie
        super.init(id:id, programme_id: programme_id, titre:titre)
    }
    
    func getRepetition() -> Int
    {
        return self.repetition
        
    }
    
    func getSerie() -> Int
    {
        return self.serie
    }
    
    func setRepetition(repetition : Int)
    {
        self.repetition = repetition
    }
    
    func setSerie(serie : Int)
    {
        self.serie = serie
    }
    
    
    
    
    
    
}
