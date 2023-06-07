//
//  CategoryRowView.swift
//  LutfiAzizTestCubmu
//
//  Created by Lutfi Aziz on 06/06/23.
//

import SwiftUI
import Foundation
import Combine
import SwiftyJSON
import SDWebImageSwiftUI

struct CategoryRowView: View {
    
    @StateObject var couponM = CouponViewModel()
    
    var model : CategoryModel.VType? = nil
    
    @Binding var index : Int
    @Binding var show : Bool
    
    var callbackTabBar : () -> ()
    
    var body: some View {
        
       
     
            Button(action: {
                
                self.index = Int(self.model?.categoryId ?? "N/A") ?? 99
                    
//                self.couponM.getAllCoupon(categoryId: self.model?.categoryId ?? "N/A")
                callbackTabBar()
                    
                
            }) {
                
                VStack{
                    
                    Text(model?.categoryName ?? "N/A")
                        .foregroundColor(.white)
                        .fontWeight(self.index == Int(self.model?.categoryId ?? "N/A") ?? 99 ? .bold : .none)
                        .fixedSize(horizontal: true, vertical: false)
                    
                    Capsule().fill(self.index == Int(self.model?.categoryId ?? "N/A") ?? 99 ? Color.orange : Color.clear)
                    .frame(height: 4)
                }
            }.frame(width: UIDevice.isIpad() ? 160.5 : 85, height: UIDevice.isIpad() ? 52 : 80)
        
    }
}

struct CategoryRowView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRowView(index: .constant(1), show: .constant(true), callbackTabBar: {}
        )
    }
}
