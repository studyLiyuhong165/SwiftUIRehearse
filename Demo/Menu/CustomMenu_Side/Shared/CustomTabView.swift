//
//  CustomTabView.swift
//  CustomMenu_Side
//
//  Created by 李宇鸿 on 2022/5/7.
//

import SwiftUI

struct CustomTabView: View {
    
    // 由上层传递标记
    @Binding var currentTab : String

    @Binding var showMenu : Bool

  
    
    var body: some View {
        VStack{
            
            HStack{
                // Menu Button ...
                // 菜单按钮
                Button {
                    // Togging Menu Option ...
                    withAnimation(.spring()){
                        showMenu = true
                    }
                } label: {
                    Image(systemName: "line.3.horizontal.decrease")
                        .font(.title)
                        .foregroundColor(.white)
                }
                // Hiding When Menu is Visible...
                //  当菜单可见时隐藏…
                .opacity(showMenu ? 0 : 1)
                
                //
                Spacer()
                
                Button {
                    //
                } label: {
                    Image("Pic")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width:35,height: 35)
                        .cornerRadius(5)
                }

                
            }
            // Page Title
            // 覆盖
            .overlay(
                Text(currentTab)
                    .font(.title2.bold())
                    .foregroundColor(.white)
            )
            .padding([.horizontal,.top])
            .padding(.bottom,8)
            .padding(.top,getSfafeArea().top)
            
            TabView(selection: $currentTab) {
                Home()
                    .tag("Home")
                
                // Replace Your Cusotm Views here ...
                // 在这里替换你的自定义视图…
                Text("Discover")
                    .tag("Discover")
                
                Text("Devices")
                    .tag("Devices")
                
                Text("Profiles")
                    .tag("Profiles")


            }
            
        }
        // Disabling actions when menu is visible...
        // 当菜单可见时禁用操作…
        .disabled(showMenu)
        .frame(maxWidth:.infinity,maxHeight: .infinity)
        .overlay(
            // Close Button ...
            // 菜单按钮
            Button {
                // Togging Menu Option ...
                withAnimation(.spring()){
                    showMenu = false
                }
            } label: {
                Image(systemName: "xmark")
                    .font(.title)
                    .foregroundColor(.white)
            }
            // Hiding When Menu is Visible...
            //  当菜单可见时隐藏…
                .opacity(showMenu ? 1 : 0)
                .padding()
                .padding(.top)
            ,alignment: .topLeading
        )
        .background(
            Color.black
        )
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
