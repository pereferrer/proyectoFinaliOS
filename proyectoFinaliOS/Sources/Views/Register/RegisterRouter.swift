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
        let dataManager = DataManager()
        let viewModel = RegisterViewModel(router: router, registerRepository: loginRegisterRepository, dataManager: dataManager)
        let viewController = RegisterViewController(registerViewModel: viewModel)
        
        viewModel.view = viewController
        router.viewController = viewController
        
        return viewController
    }
    
    func navigateToMainView(){
        let tabBar = TabBarController(topicsController: TopicsRouter.configureModule(), categoriesController: CategoriesTopicsRouter.configureModule(), createTopicController: CreateTopicRouter.configureModule(), detailUserController: DetailUserRouter.configureModule())
        
        tabBar.modalPresentationStyle = .fullScreen
        self.viewController?.present(tabBar, animated: true, completion: nil)
    }
}
