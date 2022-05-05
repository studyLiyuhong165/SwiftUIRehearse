//
//  Home.swift
//  ECommerceApp (iOS)
//
//  Created by 李宇鸿 on 2022/5/5.
//

import SwiftUI

struct Home: View {
    @Namespace var animation
    @StateObject var homeData : HomeViewModel = HomeViewModel()
    
    var body: some View {
        ScrollView(.vertical,showsIndicators: false) {
            
            VStack(spacing : 15){
                // Search Bar ...
                // 搜索栏……
                HStack(spacing: 15){
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                        .foregroundColor(.gray)
                    
                    // Since we need a separate view for search bar ...
                    // 因为我们需要一个单独的视图搜索栏…
                    TextField("Search",text: .constant("")).disabled(true)
                }
                .padding(.vertical,12)
                .padding(.horizontal)
                .background(
                    Capsule()
                        .strokeBorder(Color.gray,lineWidth: 0.8)
                )
                .frame(width:getRect().width / 1.6)
                .padding(.horizontal,25)
                
                // Text
                // 文本
                Text("Order online\ncollect in store")
                    .font(.custom(customFont, size: 28).bold())
                    .frame(maxWidth:.infinity,alignment: .leading)
                    .padding(.top)
                    .padding(.horizontal,25)
                
                // Products Tab ...
                // 产品标签……
                ScrollView(.horizontal,showsIndicators: false){
                    HStack(spacing: 18){
                        ForEach(ProductType.allCases,id :\.self){ type in
                            // Product Type View ...
                            ProductTypeView(type: type)
                        }
                    }
                    .padding(.horizontal,25)
                }
                .padding(.top,28)
                
                // Products Page ...
                ScrollView(.horizontal,showsIndicators: false){
                    HStack(spacing: 25){
                        ForEach(homeData.fillteredProducts) { product in
                            
                            // Product Card Views...
                            ProductCardView(prouct: product)
                        }
                    }
                    .padding(.horizontal,25)
                    .padding(.bottom)
                    .padding(.top,80)
                }
                .padding(.top,30)
                
                
                // See More Button ...
                // This button will show all products on the current product type
                // Since here were showing only 4
                //查看更多按钮…
                //该按钮将显示当前产品类型上的所有产品
                //因为这里只显示4
                
                Button {
                    homeData.showMoreProductsOnType.toggle()
                } label: {
                    Label {
                        Image(systemName: "arrow.right")
                    } icon: {
                        Text("see more")
                    }
                    .font(.custom(customFont, size: 15).bold())
                    .foregroundColor(Color("Purple"))
                }
                .frame(maxWidth:.infinity,alignment: .trailing)
                .padding(.trailing)
                .padding(.top,10)
                

                
            }
            .padding(.vertical)
        }
        .frame(maxWidth:.infinity,maxHeight: .infinity)
        .background(Color("HomeBG"))
        // Updating data whenver tab changes...
        .onChange(of: homeData.productType) { newValue in
            homeData.fillterProductByType()
        }
        .sheet(isPresented: $homeData.showMoreProductsOnType) {
            MoreProductsView()
        }
    }
    
    @ViewBuilder
    func ProductCardView(prouct : Product) -> some View {
        VStack(spacing : 10){
            Image(prouct.productImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: getRect().width / 2.5, height:  getRect().width / 2.5)
            
            // Moving image to top to look like its fiexd at half top ...
            // 移动图像到顶部看起来像它的固定在顶部的一半…
                .offset(y: -80)
                .padding(.bottom, -80)
            
            Text(prouct.title)
                .font(.custom(customFont, size: 18))
                .fontWeight(.semibold)
                .padding(.top)
            
            Text(prouct.subtitle)
                .font(.custom(customFont, size: 18))
                .foregroundColor(.gray)
            
            
            Text(prouct.price)
                .font(.custom(customFont, size: 18))
                .fontWeight(.bold)
                .foregroundColor(Color("Purple"))
                .padding(.top)
        }
        .padding(.horizontal,20)
        .padding(.bottom,22)
        .background(
            Color.white
                .cornerRadius(25)
        )
        
    }
    
    @ViewBuilder
    func ProductTypeView(type:ProductType) -> some View {
        Button {
            // updating Current Type...
            withAnimation {
                homeData.productType = type
            }
        } label: {
            Text(type.rawValue)
                .font(.custom(customFont, size: 15))
                .fontWeight(.semibold)
            // Changing Color based on Current product Types ...
                .foregroundColor(
                    homeData.productType == type ? Color("Purple") : Color.gray)
                .padding(.bottom,10)
            // Adding Indicator at bottom ....
                .overlay(
                    // Adding Mathed Geometry Effect...
                    ZStack{
                        if homeData.productType == type {
                            Capsule()
                                .fill(Color("Purple"))
                                .matchedGeometryEffect(id: "PRODICTTAB", in: animation)
                                .frame(height:2)
                        }
                        else {
                            Capsule()
                                .fill(Color.clear)
                                .frame(height:2)
                        }
                    }
                        .padding(.horizontal,-5),alignment:.bottom
                        
                )
        }

    }
    
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


//// Exteding view to get Screen Bounds....
//extension View{
//    func getRect() -> CGRect {
//        return UIScreen.main.bounds
//    }
//}

//  Since we alredy declared ....
// 因为我们已经声明了....
