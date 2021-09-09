//
//  ArticleTableViewCell.swift
//  articles
//
//  Created by Hexa-MingJie.Lai on 08/09/2021.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var publishedDateLabel: UILabel!
    
    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        publishedDateLabel.font = UIFont.systemFont(ofSize: 12)
    }
}
