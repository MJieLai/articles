//
//  SearchViewController.swift
//  articles
//
//  Created by Hexa-MingJie.Lai on 08/09/2021.
//

import UIKit

class SearchViewController: UIViewController {
    
    //MARK: - Variable
    private var searchViewModel : SearchViewModel!
        
    // MARK: - Outlets
    @IBOutlet weak var searchTextfield: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupButtons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //* Clear previous search
        searchTextfield.text = ""
    }
    
    //MARK: - View set up
    func setupUI() {
        self.title = "Search"
        
        searchTextfield.placeholder = "Search articles here ..."
        searchTextfield.delegate = self
        searchTextfield.keyboardType = .asciiCapable
        
        searchButton.titleLabel?.font =  UIFont.boldSystemFont(ofSize: 15)
        searchButton.tintColor = UIColor.white
        searchButton.setTitle("Search", for: .normal)
        searchButton.backgroundColor = UIColor.systemBlue
    }
    
    func setupButtons() {
        searchButton.addTarget(self, action: #selector(searchAction), for: .touchUpInside)
    }
    
    //MARK:- Button Method
    @objc func searchAction(sender: UIButton!) {
        if let searchText = searchTextfield.text, !searchText.isEmpty {
            let articleViewController = self.storyboard?.instantiateViewController(withIdentifier: "ArticleViewController") as! ArticleViewController
            articleViewController.searchText = searchText
            self.navigationController?.pushViewController(articleViewController, animated: true)
        }
        else {
            let alert = UIAlertController(title: "Alert", message: "Please enter something to start searching", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

//MARK:- Textfield
extension SearchViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.isFirstResponder {
            let validString = CharacterSet(charactersIn: " !@#$%^&*()_+{}[]|\"<>,.~`/:;?-=\\¥'£•¢")

            if textField.textInputMode?.primaryLanguage == nil || string.rangeOfCharacter(from: validString) != nil{
                return false
            }
        }
        return true
    }
}

