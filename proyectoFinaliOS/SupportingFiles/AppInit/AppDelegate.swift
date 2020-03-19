//
//  AppDelegate.swift
//  proyectoFinaliOS
//
//  Created by Pere Josep Ferrer Ventura on 25/02/2020.
//  Copyright © 2020 Pere Josep Ferrer Ventura. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private let databaseCoreDataName = "EhHoDB"
    lazy var persistentContainer: NSPersistentContainer = {
        let container =  NSPersistentContainer(name: databaseCoreDataName)
        container.loadPersistentStores(completionHandler: {(storeDescription, error) in
        })
        return container
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        checkNetwork()
        
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        print(paths[0])
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let viewController = LoginRouter.configureModule()
        
        window?.rootViewController = viewController
        
        return true
    }
}


//Mark: -Coredata extension
extension AppDelegate{
    func saveDatabaseContext(){
        let context = persistentContainer.viewContext
        
        if context.hasChanges{
            do{
                try context.save()
            }catch{
                print("Error Coredata save context")
            }
        }
    }
    
    func checkNetwork(){
           if #available(iOS 12.0, *) {
               let networkStatus = CheckInternetStatus()
               networkStatus.checkConnetionStatus()
           } else {
               // Fallback on earlier versions
           }
       }
       
       func setLastSyncData(){
           let dataManager = DataManager()
           dataManager.saveLastSync(date: Date())
       }
}

