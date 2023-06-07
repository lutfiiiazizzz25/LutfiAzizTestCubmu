//
//  ContentView.swift
//  LutfiAzizTestCubmu
//
//  Created by Lutfi Aziz on 05/06/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var categoryM = CategoryViewModel()
    @StateObject var couponM = CouponViewModel()
    
    @State var index = 0
    @State var show = false
    @State var isPresented = false
    @State var isRedeemed = false
    
    func fileExists(at url: URL, completion: @escaping (Bool) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = "HEAD"
        request.timeoutInterval = 1.0 // Adjust to your needs
        URLSession.shared.dataTask(with: request) { _, response, _ in
            completion((response as? HTTPURLResponse)?.statusCode == 200)
        }.resume()
    }

 
    
    var body: some View {
        VStack(spacing:0){
            
            HeaderMenu()
          
            Title()
           
            getCoupon(couponM: couponM,
                      index: self.$index,
                      show: self.$show,
                      isPresented: self.$isPresented,
                      isRedeemed: self.$isRedeemed,
                      callbackBtnRedeemed: {doRedeemed()}
            )
            
           
            Spacer()
           
            AppBar(categoryVM: categoryM, index: self.$index,show: self.$show,
                callbackTabBar: {doFilterCoupon()}
            )
        
        }.fullScreenCover(isPresented: $isPresented){
            FullScreenModalView(index:self.$index)
        }
    }
    
    func doFilterCoupon(){
        self.couponM.getAllCoupon(categoryId: String(index))
    }
    
    func doshowModalCoupon(){
        self.isPresented    = true
    }
    
    func doRedeemed(){
        self.isPresented    = true
        self.isRedeemed     = true
    }
    
    func doCloseModalCoupon(){
        self.isPresented    = false
        self.isRedeemed     = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().background(Color.black)
    }
}


struct FullScreenModalView: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var index:Int
  
    
    var body: some View {
        ZStack {
            Color.primary.edgesIgnoringSafeArea(.all)
            VStack{
                HStack{
                    Text("Detail Coupon").foregroundColor(Color.red)
                }

                HStack{
                    Button("Dismiss Modal") {
                        dismiss()
                    }
                }
            }
        }
    }
}

struct HeaderMenu : View {

    var body : some View{
        HStack{
            HStack() {
               Image("Logo Cubmu")
                   .resizable()
                   .frame(width: 112, height: 36)
            }
            
            Spacer()
            
            HStack(spacing: 24) {
                Image("Search")
                    .resizable()
                    .frame(width: 17.5, height: 17.5)
        
                Image("Notification")
                    .resizable()
                    .frame(width: 22, height: 22)
                
                Image("Icon User Premium")
                    .resizable()
                    .frame(width: 32, height: 32)
            }
            
            HStack() {
                Image("Arrow Down")
                    .resizable()
                    .frame(width: 9.33, height: 5.09)
           }
        }.frame(height: 84)
        .padding(.leading, UIDevice.isIpad() ? 156 : 16)
    }
}

struct Title : View {

    var body : some View{
        HStack(){
            Text("Benefit Kupon Untuk Kamu").textStyle(TitleTextStyle())
        }
        .frame(maxWidth: .infinity,alignment: .leading)
        .padding(.top, UIDevice.isIpad() ? 150 : 46)
        .padding(.leading, UIDevice.isIpad() ? 156 : 16)
    }
}


struct getCoupon : View {
    
    @StateObject var couponM = CouponViewModel()
    
    @Binding var index:Int
    @Binding var show:Bool
    @Binding var isPresented:Bool
    @Binding var isRedeemed:Bool
    var callbackBtnRedeemed : () -> ()
    
    let columns: [GridItem] =  Array(repeating: .init(.flexible()), count: UIDevice.isIpad() ? 3 : 1)
    var body : some View{
       
        HStack {
            if couponM.isLoading {
                if couponM.dataList.isEmpty {
                    VStack{
                        Spacer()
                        Text("Data tidak tersedia")
                        Spacer()
                    }
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns){
                            ForEach(couponM.dataList) { model in
                                CouponRowView(model: model,
                                              isPresented: self.$isPresented,
                                              isRedeemed: self.$isRedeemed,
                                              callbackBtnRedeemed: callbackBtnRedeemed
                                )
                            }
                        }.padding(.leading, 16)
                            .padding(.top, UIDevice.isIpad() ? 42 : 42)
                        
                    }.frame(maxHeight: .infinity)
                }
            } else {
                VStack{
                    Spacer()
                    Text("Memuat...")
                    Spacer()
                }
                
            }
        }.onAppear {
            self.couponM.getAllCoupon(categoryId: String(index))
        }
    }
}

struct AppBar : View {

    @StateObject var categoryVM = CategoryViewModel()
    @Binding var index : Int
    @Binding var show : Bool
    
    var callbackTabBar : () -> ()
    
    var body : some View{
        let sortDataBycategoryId = categoryVM.dataList.sorted(by: { Int($0.categoryId)! < Int($1.categoryId) ?? 0 })
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                Button(action: {
                    
                    self.index = 0
                    callbackTabBar()
                    
                }) {
                    
                    VStack{
                        
                        Text("All")
                            .foregroundColor(.white)
                            .fontWeight(self.index == 0 ? .bold : .none)
                        
                        Capsule().fill(self.index == 0 ? Color.orange : Color.clear)
                        .frame(height: 4)
                    }
                }.frame(width: UIDevice.isIpad() ? 160.5 : 80, height: UIDevice.isIpad() ? 52 : 80)
                
                ForEach(sortDataBycategoryId) { model in
                    CategoryRowView(model: model, index: self.$index, show: self.$show, callbackTabBar: callbackTabBar)
                }

 
            }
            
        }.onAppear {
            self.categoryVM.getAllCategory()
        }
    }
}



class Host : UIHostingController<ContentView>{
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        
        return .darkContent
    }
}


 
   
