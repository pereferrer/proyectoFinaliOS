//
//  TopicsByCategoryViewController.swift
//  Eh-Ho
//
//  Created by Pere Josep Ferrer Ventura on 23/07/2019.
//  Copyright © 2019 KeepCoding. All rights reserved.
//

import UIKit

class TopicsByCategoryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageNewTopic: UIImageView!
    
    let cellIdentifier = "TopicsByCategoryTableViewCell"
    let viewModel:TopicsByCategoryViewModel
    var topics:[TopicModel] = []
    var topicsFiltered:[TopicModel] = []
    var resultSearchController = UISearchController()
    var urlMoreTopics: String?
    var isLoading = false

    
    init(viewModel: TopicsByCategoryViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewDidLoad()
        title = "Topics"
    }
}

extension TopicsByCategoryViewController{
    
    private func configureUI(){
        self.configureNavigationUI()
        self.setConstraintImageNewTopic()
        self.setConstraintsTableview()
        self.configureTableViewUI()
        self.configureButtonNewTopic()
        self.animateImageNewTopic()
    }
    
    
    private func setConstraintsTableview(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0.0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0.0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0.0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0.0)
        ])
    }
    
    private func setConstraintImageNewTopic(){
        imageNewTopic.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageNewTopic.widthAnchor.constraint(equalToConstant: 64.0),
            imageNewTopic.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -15.0),
            imageNewTopic.heightAnchor.constraint(equalToConstant: 64.0),
            imageNewTopic.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15.0)
        ])
    }
    
    private func configureTableViewUI(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 96
        let cell = UINib(nibName: cellIdentifier, bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: cellIdentifier)
        let headerNib = UINib.init(nibName: "TopicsByCategoryHeader", bundle: Bundle.main)
        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "TopicsByCategoryHeader")
        resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()

            tableView.tableHeaderView = controller.searchBar

            return controller
        })()
        
        // Reload the table
        tableView.reloadData()
    }
    
    private func configureNavigationUI(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        title = "Topics"
        self.navigationController?.navigationBar.tintColor = UIColor(rgb: 0xF39000)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(activeSearchBar))
    }
    
    @objc private func activeSearchBar(){
        if(resultSearchController.isActive){
            resultSearchController.isActive = false
        }else{
            resultSearchController.isActive = true
        }
    }
    
    private func configureButtonNewTopic(){
        // create tap gesture recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(gesture:)))
        
        // add it to the image view;
        imageNewTopic.addGestureRecognizer(tapGesture)
        // make sure imageView can be interacted with by user
        imageNewTopic.isUserInteractionEnabled = true
    }
    
    @objc func imageTapped(gesture: UIGestureRecognizer) {
        // if the tapped view is a UIImageView then set it to imageview
        if (gesture.view as? UIImageView) != nil {
            print("Image Tapped")
            tabBarController?.selectedIndex = 1
            
        }
    }
    
    private func animateImageNewTopic(){
        UIView.animate(withDuration: 2, delay: 0.0,  options: [.repeat, .autoreverse], animations: {
            UIView.setAnimationRepeatCount(2)
            self.imageNewTopic.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }, completion: { _ in
            self.imageNewTopic.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
    }
}

extension TopicsByCategoryViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (resultSearchController.isActive) {
            let id = self.topicsFiltered[indexPath.row].id
            viewModel.didTapInTopic(id: id, topicTitle: self.topicsFiltered[indexPath.row].title)
        } else {
            let id = self.topics[indexPath.row].id
            viewModel.didTapInTopic(id: id, topicTitle: self.topics[indexPath.row].title)
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TopicsByCategoryHeader") as! TopicsByCategoryHeader
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 151
    }
}

extension TopicsByCategoryViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (resultSearchController.isActive) {
            return topicsFiltered.count
        } else {
            return topics.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (resultSearchController.isActive) {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TopicsByCategoryTableViewCell else {
                return UITableViewCell()
            }
            
            cell.configureCell(urlsString: topicsFiltered[indexPath.row].avatar_template)
            cell.titleLabel.text = topicsFiltered[indexPath.row].title
            cell.countVisits.text = String(topicsFiltered[indexPath.row].visits)
            
            return cell
        }
        else {
           guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TopicsByCategoryTableViewCell else {
                return UITableViewCell()
            }
            
            cell.configureCell(urlsString: topics[indexPath.row].avatar_template)
            cell.titleLabel.text = topics[indexPath.row].title
            cell.countVisits.text = String(topics[indexPath.row].visits)
            
            return cell
        }
    }
    
     func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastSectionIndex = tableView.numberOfSections - 1
        let lastRowIndex = tableView.numberOfRows(inSection: lastSectionIndex) - 1
        if indexPath.section ==  lastSectionIndex && indexPath.row == lastRowIndex {
           // print("this is the last cell")
            let spinner = UIActivityIndicatorView(style: .gray)
            spinner.startAnimating()
            spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView.bounds.width, height: CGFloat(44))

            self.tableView.tableFooterView = spinner
            self.tableView.tableFooterView?.isHidden = false
            if(urlMoreTopics != "" && urlMoreTopics != nil){
                self.isLoading = true
                let page = urlMoreTopics!.index(urlMoreTopics!.startIndex, offsetBy: +33)..<urlMoreTopics!.endIndex
                let definitions = urlMoreTopics!.index(urlMoreTopics!.startIndex, offsetBy: +23)..<urlMoreTopics!.index(urlMoreTopics!.startIndex, offsetBy: +27)
                viewModel.loadMoreTopics(page: String(urlMoreTopics![page]), definitions: String(urlMoreTopics![definitions]))
            }else{
                self.isLoading = false
                self.tableView.tableFooterView?.isHidden = true
            }
        }
    }
        
}

extension TopicsByCategoryViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        
        topicsFiltered.removeAll(keepingCapacity: false)
        
        topicsFiltered = topics.filter {
            $0.title.localizedCaseInsensitiveContains(searchController.searchBar.text!)
        }
        
        if topicsFiltered.count == 0{
            topicsFiltered = topics
        }

        self.tableView.reloadData()
    }
    
}

// MARK: - ViewModel Communication
protocol TopicsByCategoryViewControllerProtocol: class {
    func showTopics(topics: [TopicModel], urlMoreTopics:String)
    func showError(with message: String)
    func loadMoreTopics(topics: [TopicModel], urlMoreTopics:String)
}

extension TopicsByCategoryViewController: TopicsByCategoryViewControllerProtocol{
    
    func showTopics(topics: [TopicModel], urlMoreTopics:String) {
        self.topics = topics
        self.urlMoreTopics = urlMoreTopics
        self.tableView.reloadData()
    }
    
    func loadMoreTopics(topics: [TopicModel], urlMoreTopics:String){
        self.isLoading = false
        self.urlMoreTopics = urlMoreTopics
        self.topics.append(contentsOf: topics)
        self.tableView.reloadData()
    }
    
    func showError(with message: String) {
        let alert = AlertViewPresenter(title: "Error", message: message, acceptTitle: "Entendido")
        alert.present(in: self){ }
    }
}
