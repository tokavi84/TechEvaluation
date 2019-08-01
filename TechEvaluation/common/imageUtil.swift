//
//  imageUtil.swift
//  TechEvaluation
//
//  Created by kavimani on 01/08/19.
//  Copyright © 2019 kavimani. All rights reserved.
//

import Foundation
import UIKit
let imageCache = NSCache<NSString, UIImage>()
class imageUtil: NSObject {
    static let imageInstance = imageUtil()
    public func imageFromUrl(urlString: String,holderImage:UIImageView) {
        holderImage.image = nil
        if let cachedImage = imageCache.object(forKey: NSString(string: urlString)) {
            holderImage.image = cachedImage
            return
        }
        
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                 
                if error != nil {
                    print("ERROR LOADING IMAGES FROM URL: \(error ?? "" as! Error)")
                    
                    return
                }
                DispatchQueue.main.async {
                    if let data = data {
                        if let downloadedImage = UIImage(data: data) {
                            imageCache.setObject(downloadedImage, forKey: NSString(string: urlString))
                            holderImage.image = downloadedImage
                        }
                    }
                }
            }).resume()
        }
    }
}
