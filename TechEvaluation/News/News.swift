//
//  news.swift
//  TechEvaluation
//
//  Created by kavimani on 01/08/19.
//  Copyright © 2019 kavimani. All rights reserved.
//

import Foundation

struct News : Codable {
    
    let payload : [Payload]?
    
    
    enum CodingKeys: String, CodingKey {
        case payload = "payload"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        payload = try values.decodeIfPresent([Payload].self, forKey: .payload)
    }
    
    
}
public func dataFromFile(_ filename: String) -> Data? {
    @objc class newsClass: NSObject { }
    
    let bundle = Bundle(for: newsClass.self)
    if let path = bundle.path(forResource: filename, ofType: "json") {
        return try? Data(contentsOf: URL(fileURLWithPath: path))
    }
    return nil
}
