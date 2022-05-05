//
//  MainPage.swift
//  ECommerceApp (iOS)
//
//  Created by 李宇鸿 on 2022/5/5.
//

import SwiftUI

struct MainPage: View {
    
    //  Current Tab...
    // 当前选项卡……
    @State var currentTab : Tab = .Home
    
    // Hiding Tab Bar...
    // 隐藏标签栏……
    init(){
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        VStack {
            TabView(selection: $currentTab){
                Home()
                    .tag(Tab.Home)
                Text("Liked")
                    .tag(Tab.Liked)
                Text("Profile")
                    .tag(Tab.Profile)
                Text("Cart")
                    .tag(Tab.Cart)

            }
            
            // Custom Tab Bar...
            // 自定义标签栏……
            HStack(spacing: 0){
                ForEach(Tab.allCases,id:  \.self){ tab in
                    
                    Button {
                        // updating tab ...
                        currentTab = tab
                    } label: {
                        Image(tab.rawValue)
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width:22,height: 22)
                        // Applying little shadow at bg ....
                            .background(
                                Color("Purple")
                                    .opacity(0.1)
                                    .cornerRadius(5)
                                //blurring ...
                                    .blur(radius: 5)
                                // Making little big ...
                                    .padding(-7)
                                    .opacity(currentTab == tab ? 1: 0)
                            )
                            .frame(maxWidth:.infinity)
                            .foregroundColor(currentTab == tab ? Color("Purple") : Color.black.opacity(0.3))
                    }
                }
            }
            .padding([.horizontal,.bottom])
            .padding(.bottom,10)

        }
        .background(Color("HomeBG").ignoresSafeArea())
        
    }
}



struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}



// Making Case Iteratable ...
// 使案例可迭代…

// Tab Cases ...
// 选项卡情况下……
enum Tab : String,CaseIterable {
    // Raw Value must be image Name in asset
    // Raw Value必须是资产中的图像名称
    case Home  = "Home"
    case Liked = "Liked"
    case Profile = "Profile"
    case Cart = "Cart"

}
