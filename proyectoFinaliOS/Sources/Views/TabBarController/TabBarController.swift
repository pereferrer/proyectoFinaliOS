//
//  TabBarController.swift
//  Eh-Ho
//
//  Created by Pere Josep Ferrer Ventura on 23/07/2019.
//  Copyright © 2019 KeepCoding. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    let topicsController: UIViewController
    let categoriesController: UIViewController
    let createTopicController: UIViewController
    let detailUserController: UIViewController
    
    init(topicsController: UIViewController, categoriesController: UIViewController, createTopicController: UIViewController, detailUserController: UIViewController) {
        self.topicsController = topicsController
        self.categoriesController = categoriesController
        self.createTopicController = createTopicController
        self.detailUserController = detailUserController
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Not supported")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTabBar()
    }
    
    private func configureTabBar() {
        
        let categoriesController = self.categoriesController
        categoriesController.tabBarItem = UITabBarItem(title: "Categories", image: UIImage(named: "baseline_list_black_18dp"), selectedImage: nil)
        categoriesController.title = "Categories"
        
        let createTopicController = self.createTopicController
        createTopicController.tabBarItem = UITabBarItem(title: "Create topic", image: UIImage(named: "baseline_add_black_18dp"), selectedImage: nil)
        createTopicController.title = "Create topic"
        
        let detailUserController = self.detailUserController
        detailUserController.tabBarItem = UITabBarItem(title: "Detail User", image: UIImage(named: "baseline_message_black_18dp"), selectedImage: nil)
        detailUserController.title = "Detail User"

        self.tabBar.tintColor = UIColor(rgb: 0xF39000)
        self.tabBar.unselectedItemTintColor = .black
        self.tabBar.barTintColor = .white
        let controllers = [categoriesController, createTopicController, detailUserController]
        self.viewControllers = controllers.map { UINavigationController(rootViewController: $0) }
    }
}
