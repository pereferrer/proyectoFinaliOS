//
//  PostModel.swift
//  Eh-Ho
//
//  Created by Pere Josep Ferrer Ventura on 20/09/2019.
//  Copyright © 2019 KeepCoding. All rights reserved.
//

import Foundation

class PostModel {
    
    var id:Int = -1
    var title: String = ""
    var avatarTemplate: String = ""
    
    convenience init(id: Int = -1, title:String, avatarTemplate: String){
        self.init()
        
        self.id = id
        self.title = title
        self.avatarTemplate = avatarTemplate
    }
}
