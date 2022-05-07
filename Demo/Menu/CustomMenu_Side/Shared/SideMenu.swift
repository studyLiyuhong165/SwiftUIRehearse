//
//  SideMenu.swift
//  CustomMenu_Side
//
//  Created by 李宇鸿 on 2022/5/7.
//

import SwiftUI

struct SideMenu: View {
    // 由上层传递标记
    @Binding var currentTab : String
    
    
    // Adding Smooth Transition between tabs with the help of
    // 在选项卡之间添加平滑过渡的帮助
    
    // Matched Geometry Effect...
    // 匹配的几何效应……
    @Namespace var animation
    
    var body: some View {
        VStack(){
            
            
            HStack(spacing: 15){
                // icon
                Image("Pic")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:45,height: 45)
                    .clipShape(Circle())
                
                // text
                
                Text("宇夜iOS")
                    .font(.title2).bold()
                    .foregroundColor(.white)
            }
            .padding()
            .frame(maxWidth:.infinity,alignment: .leading)
            
            // Tab Buttons
            // For small screens
            // 对于小屏幕进行适配
            ScrollView(getRect().height < 750 ? .vertical : .init(), showsIndicators: false, content: {
                VStack(alignment:.leading,spacing: 25)
                {
                    CustomTabButton(icon: "theatermasks.fill", title: "Home")
                    CustomTabButton(icon: "safari.fill", title: "Discover")
                    CustomTabButton(icon: "applewatch", title: "Devices")
                    CustomTabButton(icon: "person.fill", title: "Profiles")
                    CustomTabButton(icon: "gearshape.fill", title: "Setting")
                    CustomTabButton(icon: "info.circle.fill", title: "About")
                    CustomTabButton(icon: "questionmark.circle.fill", title: "Help")
                    
                    Spacer()
                     
                    // making Logout as costant button with orange color ...
                    // 将注销作为固定按钮，颜色为橙色…
                    CustomTabButton(icon: "rectangle.portrait.and.arrow.right", title: "Logout")


                }
                .padding()
                .padding(.top,60)
                .padding(.leading,10)
            })
   
            // Max width of screen width
            // 最大屏幕宽度
            .frame(width:getRect().width / 2,alignment: .leading)
            .frame(maxWidth:.infinity,alignment: .leading)
            
        }
        .frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .top)
        .background(
            Color("BG")
        )
    }
    
    
    // Custom Button ....
    // 自定义按钮
    @ViewBuilder
    func CustomTabButton(icon: String,title: String) -> some View {
        Button {

            if title == "Logout" {
                // Do Action here >>>
                // 在这里 做退出操作
                print("Logout")
            }
            else {
                    withAnimation {
                        currentTab = title
                    }
            }
        } label: {
            HStack(spacing: 12){
                Image(systemName: icon)
                    .font(.title3)
                    .frame(width: currentTab == title ? 48: nil, height: 48)
                    .foregroundColor(currentTab == title ? Color("Purple") : (title == "Logout" ? Color("Orange") : .white))
                    .background(
                        
                        ZStack{
                            if currentTab == title {
                                Color.white
                                    .clipShape(Circle())
                                    .matchedGeometryEffect(id: "TABCIRCLE", in: animation)

                            }
                        }
                        
                    )
                
                Text(title)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(title == "Logout" ? Color("Orange") : .white)
            }
            .padding(.trailing)
            .background(
                
            
                ZStack {
                    if currentTab == title {
                        Color("Purple")
                            .clipShape(Capsule()) // 胶囊形状
                            .matchedGeometryEffect(id: "TABCAPSULE", in: animation)

                    }
                }
            )
        }
        .offset(x: currentTab == title ? 15 : 0)

    }
    
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


// Extending View to get Screent Bounds...
// 扩展视图获得屏幕边界…
extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}
