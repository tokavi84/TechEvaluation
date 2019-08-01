//
//  NewsVIewModel.swift
//  TechEvaluation
//
//  Created by kavimani on 01/08/19.
//  Copyright © 2019 kavimani. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
protocol NewsViewModelProtocol : class {
    func reloadLoadTable()
}

class NewsViewModel: NSObject {
    private var newsArray:[Payload] = []
    weak var delegate: NewsViewModelProtocol?

    func getNewsData() {
        let api_url = API_URL + "public/v1/news?local=en"
        Alamofire.request(api_url, method: .get, parameters: [:], encoding: JSONEncoding.default, headers: [:]).responseJSON { response in
            print(response.result)
            switch response.result {
            case .success:
                print(response)
            case .failure(_):
                print(response.error!)
                self.loadLocalJson()
            }
        }
    }
    func loadLocalJson(){
        guard let data = dataFromFile("news") else {
            return
        }
        guard let result = try? JSONDecoder().decode(News.self, from: data) else {
            return
        }
        newsArray = result.payload! 
        self.delegate?.reloadLoadTable()
    }
}
extension NewsViewModel:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:NewsViewCell = tableView.dequeueReusableCell(withIdentifier: "NewsViewCell") as! NewsViewCell
        let celldata:Payload = self.newsArray[indexPath.row]
        cell.dateLbl.text = celldata.date
        cell.titleLbl.text = celldata.title 
        imageUtil.imageInstance.imageFromUrl(urlString: celldata.image ?? "", holderImage: cell.newsImage)
        return cell
    }
    
}
