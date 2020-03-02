//
//  RegisterRouter.swift
//  proyectoFinaliOS
//
//  Created by Pere Josep Ferrer Ventura on 29/02/2020.
//  Copyright © 2020 Pere Josep Ferrer Ventura. All rights reserved.
//

import Foundation
import UIKit

class RegisterRouter {
    
    weak var viewController: UIViewController?
    
    static func configureModule() -> UIViewController {
        
        let router = RegisterRouter()
        let sessionApi = SessionAPI()
        let loginRegisterRepository = LoginRegisterImpl(session: sessionApi)
        let viewModel = RegisterViewModel(router: router, registerRepository: loginRegisterRepository)
        let viewController = RegisterViewController(registerViewModel: viewModel)
        
        viewModel.view = viewController
        router.viewController = viewController
        
        return viewController
    }
}
