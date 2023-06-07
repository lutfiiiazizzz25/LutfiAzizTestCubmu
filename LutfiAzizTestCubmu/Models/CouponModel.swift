//
//  CouponModel.swift
//  LutfiAzizTestCubmu
//
//  Created by Lutfi Aziz on 06/06/23.
//

import Foundation
import SwiftUI

class CouponModel : Codable, Identifiable {
    var status: Bool
    var statusCode: String
    var result: [VType] = [VType]()
    var option: String?
    var message: [String]
    
    class VType : Codable, Identifiable {
        var couponId: String
        var couponName: String
        var couponBrandName: String
        var couponBrandLogo: String
        var couponBenefitType: String
        var couponBenefitValue: String
        
        var couponQuota: String
        var couponCategoryId: String
  
        var couponCategoryName: String
        var couponTnc: String
        
        var couponStatus: String
        var couponStartDate: String
        
        var couponEndDate: String
        var couponCreatedAt: String
        var couponUpdatedAt: String
    }
    
}
