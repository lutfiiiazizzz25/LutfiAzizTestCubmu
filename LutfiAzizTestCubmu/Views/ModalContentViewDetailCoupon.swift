//
//  ModalContentViewDetailCoupon.swift
//  LutfiAzizTestCubmu
//
//  Created by Lutfi Aziz on 07/06/23.
//

import SwiftUI
import Foundation
import Combine
import SwiftyJSON
import SDWebImageSwiftUI

struct ModalContentViewDetailCoupon: View {
    
    var model : CouponModel.VType?
    @Binding var isPresented:Bool
    @Binding var isRedeemed:Bool
    var callbackBtnRedeemed : () -> ()
    var callbackBtnDone : () -> ()

    var body: some View {
        
//        let formatCuponEndDate  = convertDateFormat(inputDate: self.model?.couponEndDate ?? "2023-06-07 16:30:00")
        
        VStack(alignment: .leading) {

            HStack{
                HStack{
                    if model?.couponBrandLogo != "" {
                        WebImage(url: URL(string: model?.couponBrandLogo ?? "N/A"), options: .highPriority, context: nil)
                            .resizable()
                            .frame(width: 150, height: 150, alignment: .center)
                            .aspectRatio(contentMode: .fill)
                            .cornerRadius(12)
                    }
                }.frame(maxWidth: .infinity)
                Spacer()
                HStack{
                    VStack(alignment:.leading, spacing:10){
                        Text(model?.couponName ?? "N/A")
                           
                            .textStyle(CouponTitleTextStyle())
                        
                        if self.isRedeemed {
                            Text("Coupon Successfully Redeemed  ")
                                .foregroundColor(.green)
                                .textStyle(DiscountAmountTextStyle())
                        }
                        
                        HStack {
                            Text(model?.couponBenefitValue ?? "N/A")
                                .foregroundColor(.green)
                                .textStyle(DiscountAmountTextStyle())
                            
                            if (model?.couponBenefitType ?? "N/A").contains("Discount") {
                                Text("Off")
                                    .foregroundColor(.gray)
                                    .textStyle(DiscountStatusTextStyle())
                            }
                           
                        }
                        
//                        Text("Promo sampai \(formatCuponEndDate)")
//                            .foregroundColor(.gray)
//                            .textStyle(PromoDescriptionTextStyle())
                        
                        Button(action: {
                            callbackBtnDone()
                            print(String(self.isPresented))
                        }, label: {
                            HStack {
                                Spacer()
                                Text("Done")
                                Spacer()
                            }
                        })
                        .buttonStyle(PrimaryButton(isDisabled: false, height: 56))
//                        .disabled(true)
                    }
                }
            }
        }
    }
}

struct ModalContentViewDetailCoupon_Previews: PreviewProvider {
    static var previews: some View {
        ModalContentViewDetailCoupon(isPresented: .constant(false), isRedeemed: .constant(false),callbackBtnRedeemed: {}, callbackBtnDone: {})
    }
}
