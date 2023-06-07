
//
//  CouponRowView.swift
//  LutfiAzizTestCubmu
//
//  Created by Lutfi Aziz on 06/06/23.
//

import SwiftUI
import Foundation
import Combine
import SwiftyJSON
import SDWebImageSwiftUI

struct CouponRowView: View {
    var model : CouponModel.VType? = nil
    @Binding var isPresented:Bool
    @Binding var isRedeemed:Bool
    
    var callbackBtnRedeemed : () -> ()
    
    var body: some View {
        
        let formatCuponEndDate  = convertDateFormat(inputDate: model?.couponEndDate ?? "2023-06-07 16:30:00")
        
        HStack(spacing:0){
            HStack{
                if model?.couponBrandLogo != "" {

                    WebImage(url: URL(string: model?.couponBrandLogo ?? "N/A"), options: .highPriority, context: nil)
                        .resizable()
                        .frame(width: 180, height: 150)
                        .aspectRatio(contentMode: .fill)
                        
                        
                }
            }.frame(width:180,alignment: .leading)
            

            HStack{
                VStack(alignment:.leading, spacing:10){
                    Text(model?.couponName ?? "N/A")
                       
                        .textStyle(CouponTitleTextStyle())
                    
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
                    
                    Text("Promo sampai \(formatCuponEndDate)")
                        .foregroundColor(.gray)
                        .textStyle(PromoDescriptionTextStyle())
                    
                    Button(action: {
                        callbackBtnRedeemed()
                        print(String(self.isPresented))
                    }, label: {
                        HStack {
                            Spacer()
                            Text("Tukarkan")
                            Spacer()
                        }
                    })
                    .buttonStyle(PrimaryButton(isDisabled: false, height: UIDevice.isIpad() ? 40 : 25, width: UIDevice.isIpad() ? 273 : 161))
                    
                    .disabled(false)
                }
                .padding(.leading, 16)
                Spacer()
                Spacer()
            }.frame(height:150, alignment: .leading)
            .background(Color.white)
            
            
        }.cornerRadius(5)
        .padding(.top,24)
    
       
        /*
        VStack(alignment: .leading,spacing:0) {

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
                        
                        Text("Promo sampai \(formatCuponEndDate)")
                            .foregroundColor(.gray)
                            .textStyle(PromoDescriptionTextStyle())
                        
                        Button(action: {
                            self.isPresented.toggle()
                            self.isRedeemed = true
                            print(String(self.isPresented))
                        }, label: {
                            HStack {
                                Spacer()
                                Text("Tukarkan")
                                Spacer()
                            }
                        })
                        .buttonStyle(PrimaryButton(isDisabled: false, height: UIDevice.isIpad() ? 40 : 25, width: UIDevice.isIpad() ? 273 : 161))
                        
                        .disabled(true)
                    }
                }
            }
        }
        
         */
    }
}

struct CouponRowView_Previews: PreviewProvider {
    static var previews: some View {
        CouponRowView(isPresented: .constant(false),
                      isRedeemed: .constant(false),
                      callbackBtnRedeemed: {}
        )
    }
}
