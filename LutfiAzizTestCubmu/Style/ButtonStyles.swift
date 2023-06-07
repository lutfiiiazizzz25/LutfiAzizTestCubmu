//
//  ButtonStyles.swift
//  LutfiAzizTestCubmu
//
//  Created by Lutfi Aziz on 06/06/23.
//

import Foundation
import SwiftUI

struct PrimaryButton: ButtonStyle {
    var isDisabled = false
    var height = 40
    var width = 100
    func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .font(Font.custom("Mulish", size: UIDevice.isIpad() ? 16 : 12))
                .padding()
                .frame(height: CGFloat(height))
                .frame(width: CGFloat(width))
                .background(isDisabled ? .overlayGrayDisabled: (configuration.isPressed ? Color.greenDarkPrimary : Color.greenPrimary))
                .foregroundColor(isDisabled ? .overlayDisabledFg : .white)
                .cornerRadius(4)
        }
}

/*
Button(action: {
                print("login")
               
            }, label: {
                HStack {
                    Spacer()
                    Text("Tukarkan")
                    Spacer()
                }
            })
            .buttonStyle(PrimaryButton(isDisabled: false, height: 56))
            .disabled(true)
 
 
 
 
 VStack{
     HStack {
         Spacer()
         if !self.couponM.isApiReachableCouponModel {
             HStack{
                 HStack{
                     Spacer()
                     Image(systemName: "exclamationmark.icloud").foregroundColor(Color.white)
                     Text("Can't Connect to The Site!").font(.body).foregroundColor(Color.white)
                     Spacer()
                 }
             .padding()
                 .background(Color.red)
             .cornerRadius(20)
             }.padding()
         }
         
         if couponM.isLoading {
             if couponM.dataList.isEmpty {
                 Text("No data found here")
             } else {
                 VStack {
                     ForEach(couponM.dataList) { model in
                         
                         Spacer()
                         HStack {
                             Spacer()
                             if couponM.url_img != "" {
                                 WebImage(url: URL(string: couponM.url_img?.lowercased() ?? ""), options: .highPriority, context: nil)
                                     .resizable()
                                     .frame(width: 150, height: 150, alignment: .center)
                                     .aspectRatio(contentMode: .fill)
                                     .cornerRadius(12)
                             }
                             Spacer()
                         }
                         HStack  {
                             Spacer()
                             Button(action: {
                                 //self.showModalRegistration1 = false
                                 //self.titleMenu1 = "Home"
                                 print("pressed")
                             }){
                                 Text("Close").bold().font(.callout).foregroundColor(Color.gray)
                             }
                             Spacer()
                         }
                         Spacer()
                         
                     }
             
                 }.frame(alignment: .leading).background(Color.white)


             }
         } else {
//                       if isCheckData == true {
//                           VStack{
//                               Text("Loading...")
//                           }
//                       }
         }
         Spacer()
     }
 }//.onAppear(perform: {self.couponM.getHistoryPatient(search_no_registration: search_no_registration, search_datebirth: search_datebirth)})

 */
