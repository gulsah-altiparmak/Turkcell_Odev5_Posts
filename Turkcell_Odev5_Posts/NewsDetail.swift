//
//  NewsDetail.swift
//  Turkcell_Odev5_Posts
//
//  Created by Gulsah Altiparmak on 28.01.2021.
//

import UIKit

class NewsDetail: UIViewController {
   
   
    var post:Post?
    
   
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsContent: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        newsContent.layer.borderWidth = 0.3
        newsContent.layer.borderColor = UIColor.systemGray.cgColor
        newsContent.layer.cornerRadius=5.5
        newsContent.layer.masksToBounds=true
        
        newsTitle.text = post?.title.uppercased()
        newsContent.text = post?.body.capitalizingFirstLetter()
      
    }

}
extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
