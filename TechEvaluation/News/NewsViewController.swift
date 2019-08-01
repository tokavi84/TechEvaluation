//
//  NewsViewController.swift
//  TechEvaluation
//
//  Created by kavimani on 01/08/19.
//  Copyright © 2019 kavimani. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController, NewsViewModelProtocol {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var newsTable: UITableView!
    
    private var newsViewModel = NewsViewModel()
    override func viewDidLoad() {
        super.viewDidLoad() 
        self.newsTable.dataSource = newsViewModel
        self.newsTable.delegate = newsViewModel
        self.topView.layer.cornerRadius = 6
        self.topView.layer.masksToBounds = true
        newsViewModel.delegate = self
        newsViewModel.getNewsData()
        
        
    }
    func reloadLoadTable() {
        self.newsTable.reloadData()
    }
    
    
 
}
