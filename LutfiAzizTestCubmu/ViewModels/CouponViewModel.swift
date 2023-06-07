//
//  CouponViewModel.swift
//  LutfiAzizTestCubmu
//
//  Created by Lutfi Aziz on 06/06/23.
//

import Foundation
import Combine
import SwiftUI
import SystemConfiguration
import Security

class CouponViewModel : ObservableObject {
    
    // membuat didchange
    var didChange = PassthroughSubject<CouponViewModel, Never>()
    
    @Published var isLoading : Bool = false
    @Published var isConnectedNews : Bool = true
    @Published var dataList = [CouponModel.VType]()
    
    @Published var isApiReachableCouponModel : Bool = true {
        didSet {
            didChange.send(self)
        }
    }
    
   
    func getAllCoupon(categoryId: String){
      
        isLoading = false
        guard let url = URL(string: "\(Config.HOSTNAME)getCoupon?username=user1673281842743") else {
            return
        }
        
        
        //let json: [String: Any] = ["username": "user1673281842743"]
        
        //let jsonData = try? JSONSerialization.data(withJSONObject: json)

        var request = URLRequest(url: url)
         
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        //request.httpBody = jsonData
       
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                self.isLoading = true
            }
            
            guard let _ = data, error == nil else {
                print("No data response")

                DispatchQueue.main.async {
                    self.isApiReachableCouponModel = false
                }
                return

            }
          
            if error == nil {
              
                if data != nil {
                   
                    do {
                     
                        let myServiceResponse = try JSONDecoder().decode(CouponModel.self, from: data!)
                        
                      
                        DispatchQueue.main.async {
                            self.dataList = myServiceResponse.result
                         
                            if categoryId != "0" {
                                self.dataList = self.dataList.filter {
                                    $0.couponCategoryId == categoryId
                                }
                            }
                        }
                    } catch let exception {
                        print("Error Coupon \(exception)")
                        print(response ?? "")
                    }
                }else {
                    print("Something went wrong!")
                }
            } else {
                print(error?.localizedDescription ?? "N/A")
            }
        }
        task.resume()
    }
}
