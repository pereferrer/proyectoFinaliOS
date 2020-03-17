//
//  LoginRouter.swift
//  proyectoFinaliOS
//
//  Created by Pere Josep Ferrer Ventura on 07/03/2020.
//  Copyright © 2020 Pere Josep Ferrer Ventura. All rights reserved.
//

import Foundation
import UIKit

class LoginRouter {
    
    weak var viewController: UIViewController?
    
    static func configureModule() -> UIViewController {
        
        let router = LoginRouter()
        let sessionApi = SessionAPI()
        let loginRegisterRepository = LoginRegisterImpl(session: sessionApi)
        let dataManager = DataManager()
        let viewModel = LoginViewModel(router: router, registerRepository: loginRegisterRepository, dataManager: dataManager)
        let viewController = LoginViewController(loginViewModel: viewModel)
        
        viewModel.view = viewController
        router.viewController = viewController
        
        return viewController
    }
    
    func navigateToCreateAccount() {
        let registerViewController = RegisterRouter.configureModule()
        //registerViewController.modalPresentationStyle = .fullScreen
        viewController?.present(registerViewController, animated: true)
    }
    
    func navigateToMainView(){
        let tabBar = TabBarController(topicsController: TopicsRouter.configureModule(), categoriesController: CategoriesTopicsRouter.configureModule(), createTopicController: CreateTopicRouter.configureModule(), detailUserController: DetailUserRouter.configureModule())
        
        tabBar.modalPresentationStyle = .fullScreen
        self.viewController?.present(tabBar, animated: true, completion: nil)
    }
}
