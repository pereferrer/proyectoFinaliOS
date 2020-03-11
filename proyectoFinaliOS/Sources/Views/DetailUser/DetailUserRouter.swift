//
//  DetailUserRouter.swift
//  proyectoFinaliOS
//
//  Created by Pere Josep Ferrer Ventura on 10/03/2020.
//  Copyright © 2020 Pere Josep Ferrer Ventura. All rights reserved.
//

import Foundation
import UIKit

class DetailUserRouter {
    
    weak var viewController: UIViewController?
    
    static func configureModule() -> UIViewController {
        
        let router = DetailUserRouter()
        let sessionApi = SessionAPI()
        let loginRegisterRepository = LoginRegisterImpl(session: sessionApi)
        let viewModel = DetailUserViewModel(router: router, registerRepository: loginRegisterRepository)
        let viewController = DetailUserViewController(detailUserViewModel: viewModel)
        
        viewModel.view = viewController
        router.viewController = viewController
        
        return viewController
    }
}
