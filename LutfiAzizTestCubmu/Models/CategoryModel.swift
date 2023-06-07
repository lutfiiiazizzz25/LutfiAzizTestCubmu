//
//  CategoryModel.swift
//  LutfiAzizTestCubmu
//
//  Created by Lutfi Aziz on 05/06/23.
//

import Foundation

class CategoryModel : Codable, Identifiable {
    var status: Bool
    var statusCode: String
    var result: [VType] = [VType]()
    var option: String?
    var message: [String]
    
    class VType : Codable, Identifiable {
        var categoryId: String
        var categoryName: String
    }
    
}
