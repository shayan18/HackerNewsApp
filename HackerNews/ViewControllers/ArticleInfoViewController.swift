//
//  ArticleInfoViewController.swift
//  HackerNews
//
//  Created by Shayan Ali on 23/11/2019.
//  Copyright © 2019 Shayan Ali. All rights reserved.
//

import UIKit
import WebKit

class ArticleInfoViewController: UIViewController,Storyboarded {
    @IBOutlet weak var articleWebView: WKWebView!
    var articleUrl = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: articleUrl) {
            articleWebView.load(URLRequest(url: url))

        }
    }
    

}
