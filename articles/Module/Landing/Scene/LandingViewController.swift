//
//  LandingViewController.swift
//  articles
//
//  Created by Hexa-MingJie.Lai on 08/09/2021.
//

import UIKit

class LandingViewController: UIViewController {
    
    //MARK: - Variable
    private var landingViewModel : LandingViewModel!
        
    // MARK: - Outlets
    @IBOutlet weak var searchHeaderTitleLabel: UILabel!
    @IBOutlet weak var searchTitleLabel: UILabel!
    @IBOutlet weak var searchButton: UIButton!
    
    @IBOutlet weak var popularHeaderTitleLabel: UILabel!
    @IBOutlet weak var viewedTitleLabel: UILabel!
    @IBOutlet weak var viewedButton: UIButton!
    
    @IBOutlet weak var sharedTitleLabel: UILabel!
    @IBOutlet weak var sharedButton: UIButton!
    
    @IBOutlet weak var emailedTitleLabel: UILabel!
    @IBOutlet weak var emailedButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupButtons()
    }
    
    //MARK: - View set up
    func setupUI() {
        self.title = "NYT"
        
        searchHeaderTitleLabel.font = UIFont.boldSystemFont(ofSize: 15)
        searchHeaderTitleLabel.text = "Search"
        
        searchTitleLabel.font = UIFont.systemFont(ofSize: 14)
        searchTitleLabel.text = "Search Articles"
        
        popularHeaderTitleLabel.font = UIFont.boldSystemFont(ofSize: 15)
        popularHeaderTitleLabel.text = "Popular"
        
        viewedTitleLabel.font = UIFont.systemFont(ofSize: 14)
        viewedTitleLabel.text = "Most Viewed"
        
        sharedTitleLabel.font = UIFont.systemFont(ofSize: 14)
        sharedTitleLabel.text = "Most Shared"
        
        emailedTitleLabel.font = UIFont.systemFont(ofSize: 14)
        emailedTitleLabel.text = "Most Emailed"
    }
    
    func setupButtons() {
        searchButton.addTarget(self, action: #selector(searchAction), for: .touchUpInside)
        viewedButton.addTarget(self, action: #selector(viewedAction), for: .touchUpInside)
        sharedButton.addTarget(self, action: #selector(sharedAction), for: .touchUpInside)
        emailedButton.addTarget(self, action: #selector(emailedAction), for: .touchUpInside)
    }
    
    //MARK:- Button Method
    @objc func searchAction(sender: UIButton!) {
        let searchViewController = self.storyboard?.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        self.navigationController?.pushViewController(searchViewController, animated: true)
    }
    
    @objc func viewedAction(sender: UIButton!) {
        let articleViewController = self.storyboard?.instantiateViewController(withIdentifier: "ArticleViewController") as! ArticleViewController
        articleViewController.articleType = "viewed"
        self.navigationController?.pushViewController(articleViewController, animated: true)
    }
    
    @objc func sharedAction(sender: UIButton!) {
        let articleViewController = self.storyboard?.instantiateViewController(withIdentifier: "ArticleViewController") as! ArticleViewController
        articleViewController.articleType = "shared"
        self.navigationController?.pushViewController(articleViewController, animated: true)
    }
    
    @objc func emailedAction(sender: UIButton!) {
        let articleViewController = self.storyboard?.instantiateViewController(withIdentifier: "ArticleViewController") as! ArticleViewController
        articleViewController.articleType = "emailed"
        self.navigationController?.pushViewController(articleViewController, animated: true)
    }
}
