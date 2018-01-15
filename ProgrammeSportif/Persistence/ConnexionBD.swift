//
//  Connection.swift
//  ProgrammeSportif
//
//  Created by if26-grp1 on 13/12/2017.
//  Copyright © 2017 MougneMarcellin. All rights reserved.
//

import Foundation
import SQLite


class ConnexionBD{

    static var database: Connection!
    
    static func connexion(){
        do {
            if(database == nil){
                let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                let fireUrl = documentDirectory.appendingPathComponent("programmeSportif").appendingPathExtension("sqlite3")
                let database = try Connection(fireUrl.path)
                self.database = database
            }
        } catch {
            print(error)
        }
    }
    
    static func encryptMessage(message: String) throws -> String {
  
        let encryptionKey = "AwFJ2X4+azDOq0qVVvnoowYy9q5JHx24lr9CrTH72rRc5+s/YL9+WUN5Vf63vnaO4v53h/CI2WOEZqqW3SYdLtFpkYZi7b6hq+I58jleZgyKLYlPRGCAQJWjSVAacQk1LFxGArN9MDmwj1evbdt/Kj74"
        let messageData = message.data(using: .utf8)!
        let cipherData = RNCryptor.encrypt(data: messageData, withPassword: encryptionKey)
        return cipherData.base64EncodedString()
    
    }
    
    static func decryptMessage(encryptedMessage: String) throws -> String {
        
        let encryptionKey = "AwFJ2X4+azDOq0qVVvnoowYy9q5JHx24lr9CrTH72rRc5+s/YL9+WUN5Vf63vnaO4v53h/CI2WOEZqqW3SYdLtFpkYZi7b6hq+I58jleZgyKLYlPRGCAQJWjSVAacQk1LFxGArN9MDmwj1evbdt/Kj74"
        let encryptedData = Data.init(base64Encoded: encryptedMessage)!
        let decryptedData = try RNCryptor.decrypt(data: encryptedData, withPassword: encryptionKey)
        let decryptedString = String(data: decryptedData, encoding: .utf8)!
        
        return decryptedString
    }
    
    //static func generateEncryptionKey(withPassword password:String) throws -> String {
    //    let randomData = RNCryptor.randomData(ofLength: 32)
    //    let cipherData = RNCryptor.encrypt(data: randomData, withPassword: password)
    //    return cipherData.base64EncodedString()
    //}
    
    //123456789
    
    
}

