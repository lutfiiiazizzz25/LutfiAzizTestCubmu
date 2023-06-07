//
//  CategoryViewModel.swift
//  LutfiAzizTestCubmu
//
//  Created by Lutfi Aziz on 05/06/23.
//

import Foundation
import Combine
import SwiftUI
import SystemConfiguration
import Security

class CategoryViewModel : ObservableObject {
    
    // membuat didchange
    var didChange = PassthroughSubject<CategoryViewModel, Never>()
    
    @Published var isLoading : Bool = false
    @Published var isConnectedNews : Bool = true
    @Published var dataList = [CategoryModel.VType]()
    
    @Published var isApiReachableCategoryModel : Bool = true {
        didSet {
            didChange.send(self)
        }
    }
    
   
    func getAllCategory(){
      
        isLoading = false
        guard let url = URL(string: "\(Config.HOSTNAME)getAllCategory?username=user1673281842743") else {
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
                    self.isApiReachableCategoryModel = false
                }
                return

            }
          
            if error == nil {
              
                if data != nil {
                   
                    do {
                     
                        let myServiceResponse = try JSONDecoder().decode(CategoryModel.self, from: data!)
                        
                      
                        DispatchQueue.main.async {
                            self.dataList = myServiceResponse.result
                        }
                    } catch let exception {
                        print("Error Category \(exception)")
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
