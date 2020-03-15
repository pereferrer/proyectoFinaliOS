//
//  UserDefaultsPreferences.swift
//  Eh-Ho
//
//  Created by Pere Josep Ferrer Ventura on 21/09/2019.
//  Copyright © 2019 KeepCoding. All rights reserved.
//

import Foundation

class UserDefaultPreferences{
    
    private let lastSync = "LAST_SYNC"
    
    
    func saveLastSync(date: Date){
        UserDefaults.standard.set(date, forKey: lastSync)
    }
    
    func getLastSync()->Date?{
        return UserDefaults.standard.object(forKey: lastSync) as? Date
    }
    
    func isLogged()-> Bool{
        let user = UserDefaults.standard.string(forKey: "username")
        return user != nil
    }
    
    func saveSession(username: String){
        UserDefaults.standard.set(username, forKey: "username")
    }
    
    func getUsername()-> String{
        return UserDefaults.standard.string(forKey: "username") ?? ""
    }
    
    func logOut(){
        UserDefaults.standard.removeObject(forKey: "username")
    }
}
