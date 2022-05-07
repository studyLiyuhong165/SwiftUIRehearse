//
//  MainView.swift
//  CustomMenu_Side
//
//  Created by 李宇鸿 on 2022/5/7.
//

import SwiftUI

struct MainView: View {
    
    // Current Tab ...
    @State var currentTab : String = "Home"
    
    
    // Menu Option ...
    // 菜单选项
    @State var showMenu : Bool = false
    
    // Hiding Native Tab Bar ...
    // 隐藏本地标签栏…
    init(){
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        
        ZStack{
            // Custom Side Menu...
            // 自定义侧菜单……
            SideMenu(currentTab:$currentTab)
            
      
            
            
            // Main Tab View ....
            // 主标签页的页面....
            CustomTabView(currentTab:$currentTab,showMenu:$showMenu)
            // Appling Corner Radius ...
            // 添加圆角
                .cornerRadius(showMenu ? 25 : 0)
            
            //  Making 3D rotation
                .rotation3DEffect(.init(degrees:  showMenu ? -15 : 0), axis: (x: 0, y: 1, z: 0),anchor: .trailing)
            // Moving view Apart...
            // 移动视图分开……
                .offset(x : showMenu ? getRect().width / 2 : 0)
                .ignoresSafeArea()

        }
        // Always Dark Mode...
        // 总是黑暗的模式…
        .preferredColorScheme(.dark)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

// Extending View to get Safe Area Values
// 扩展视图以获取安全区值
extension View {
    func getSfafeArea() -> UIEdgeInsets {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene
        else {
            return .zero
        }
        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            return.zero
        }
        return safeArea
    }
}
