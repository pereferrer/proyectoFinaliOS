//
//  DetailUserViewController.swift
//  proyectoFinaliOS
//
//  Created by Pere Josep Ferrer Ventura on 10/03/2020.
//  Copyright © 2020 Pere Josep Ferrer Ventura. All rights reserved.
//

import UIKit

class DetailUserViewController: UIViewController {

    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var usernameText: UILabel!
    @IBOutlet weak var statusText: UILabel!
    @IBOutlet weak var lastSeenText: UILabel!
    @IBOutlet weak var privateMessageText: UILabel!
    
    let detailUserViewModel: DetailUserViewModel
       
       init(detailUserViewModel: DetailUserViewModel){
           self.detailUserViewModel = detailUserViewModel
           super.init(nibName: nil, bundle: nil)
       }
       
       required init?(coder: NSCoder) {
           fatalError()
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailUserViewModel.getDetailUser(username: "Pere")//Todo cargar desde las sharedPreferences
        self.detailUserViewModel.getPrivateMessageList(username: "Pere")//Todo cargar desde las sharedPreferences
    }
}

protocol DetailUserViewControllerProtocol: class {
    func showDetailUserSuccessfully(detailUser:DetailUserResponse)
    func showPrivateMessage(privateMessageList: PrivateMessageListResponse)
    func showError(with message: String)
}


extension DetailUserViewController: DetailUserViewControllerProtocol{
    
    func showPrivateMessage(privateMessageList: PrivateMessageListResponse) {
        self.privateMessageText.text = String(privateMessageList.topic_list.topics.count)
    }
    
    func showDetailUserSuccessfully(detailUser:DetailUserResponse) {
        self.nameText.text = detailUser.name
        self.usernameText.text = detailUser.username
        self.statusText.text = detailUser.moderator == true ? "Is moderator" : "Not moderator"
        self.lastSeenText.text = detailUser.last_seen_at
        let urlString = "https://mdiscourse.keepcoding.io" + detailUser.avatar_template.replacingOccurrences(of: "{size}", with: "120")
        let url = URL(string: urlString)!
        print(urlString)
        self.avatarImage.load(url: url)
    }
    
    func showError(with message: String) {
        showAlertView(message: message, isError: true)
    }
}
extension DetailUserViewController{
    func showAlertView(message: String, isError:Bool){
        if(isError){
            let alert = AlertViewPresenter(title: "Error", message: message, acceptTitle: "Understood")
            alert.present(in: self){ }
        }else{
            let alert = AlertViewPresenter(title: "User Created", message: "Check your mail to activate the account", acceptTitle: "Understood")
            alert.present(in: self){ }
        }
    }
}
