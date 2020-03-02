//
//  LoginRegisterRepository.swift
//  proyectoFinaliOS
//
//  Created by Pere Josep Ferrer Ventura on 29/02/2020.
//  Copyright © 2020 Pere Josep Ferrer Ventura. All rights reserved.
//

import Foundation

protocol LoginRegisterRepository {
    
    func createNewUser(name: String, email: String, password: String, username: String, completation: @escaping(Result<NewUserResponse, ApiErrorResponse>)->())
}
