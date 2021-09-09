//
//  ArticleViewController.swift
//  articles
//
//  Created by Hexa-MingJie.Lai on 08/09/2021.
//

import UIKit

class ArticleViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var listView: UITableView!
    
    //MARK: - Variables
    private var articleViewModel : ArticleViewModel!
    private var dataSource: ArticleTableViewDataSource<ArticleTableViewCell,ArticleData>!
    
    public var articleType: String = ""
    public var searchText: String = ""
    
    var activityView: UIActivityIndicatorView?

    //MARK: - Lifecycle 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Articles"
        callToViewModelForUIUpdate()
        
        let nib = UINib(nibName: "ArticleTableViewCell", bundle: Bundle.main)
        listView.register(nib, forCellReuseIdentifier: "ArticleTableViewCell")
        listView.tableFooterView = UIView(frame: .zero)
    }
    
    //MARK: - View Model
    func callToViewModelForUIUpdate(){
        self.articleViewModel = ArticleViewModel()
        
        //* Call APi
        self.showActivityIndicator()
        if !articleType.isEmpty {
            self.articleViewModel.callFuncToGetArticleData(articleType: self.articleType)
        }
        else {
            self.articleViewModel.callFuncToSearchArticleData(searchText: self.searchText)
        }
        
        //* Display data
        self.articleViewModel.bindArticleViewModelToController = {
            if self.articleViewModel.articleData.count > 0 {
                self.updateDataSource()
            }
            else {
                self.displayNoDataAlert()
            }
            
        }
    }
    
    func updateDataSource(){
        self.dataSource = ArticleTableViewDataSource(cellIdentifier: "ArticleTableViewCell", items: self.articleViewModel.articleData, configureCell: { (cell, evm) in
            cell.titleLabel.text = evm.title
            cell.publishedDateLabel.text = evm.published_date
        })
        
        DispatchQueue.main.async {
            self.hideActivityIndicator()
            self.listView.dataSource = self.dataSource
            self.listView.reloadData()
        }
    }
    
    func displayNoDataAlert() {
        DispatchQueue.main.async {
            self.hideActivityIndicator()
            let alert = UIAlertController(title: "Error", message: self.articleViewModel.apiError, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {_ in
                self.navigationController?.popViewController(animated: true)
            }))
            self.present(alert, animated: true, completion: nil)
            
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    //MARK: - Helper    
    func showActivityIndicator() {
        activityView = UIActivityIndicatorView(style: .large)
        activityView?.center = self.view.center
        self.view.addSubview(activityView!)
        activityView?.startAnimating()
    }

    func hideActivityIndicator(){
        if (activityView != nil){
            activityView?.stopAnimating()
        }
    }
}
