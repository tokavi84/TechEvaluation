//
//  Payload.swift
//  TechEvaluation
//
//  Created by kavimani on 01/08/19.
//  Copyright © 2019 kavimani. All rights reserved.
//


struct Payload : Codable {
    
    let date : String?
    let descriptionField : String?
    let image : String?
    let title : String?
    
    
    enum CodingKeys: String, CodingKey {
        case date = "date"
        case descriptionField = "description"
        case image = "image"
        case title = "title"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        date = try values.decodeIfPresent(String.self, forKey: .date)
        descriptionField = try values.decodeIfPresent(String.self, forKey: .descriptionField)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        title = try values.decodeIfPresent(String.self, forKey: .title)
    }
    
    
}
