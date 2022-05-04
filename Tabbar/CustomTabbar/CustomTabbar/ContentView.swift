//
//  ContentView.swift
//  CustomTabbar
//
//  Created by 李宇鸿 on 2022/5/3.
//

import SwiftUI

struct ContentView: View {
    // MARK: Hiding Native One
    // 隐藏Native One
    init(){
        UITabBar.appearance().isHidden = true
    }
    
    
    @State var currentTab : Tab = .home
    var body: some View {
        VStack(spacing:0){
            TabView(selection:$currentTab) {
                // MARK: Need to Apply BG For Each Tab View
                // 需要为每个标签视图应用BG
                Text("Home")
                    .ApplyBG()
                    .tag(Tab.home)
                Text("Label")
                    .ApplyBG()
                    .tag(Tab.label)
                Text("Position")
                    .ApplyBG()
                    .tag(Tab.position)
                Text("Found")
                    .ApplyBG()
                    .tag(Tab.found)
                Text("My")
                    .ApplyBG()
                    .tag(Tab.my)

            }
            CustomTabbar(currentTab: $currentTab)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View{
    func ApplyBG() -> some View {
        // infinity 无穷的
        self
            .frame(maxWidth:.infinity,maxHeight: .infinity)
            .background{
                Color("BG")
                .ignoresSafeArea()
            }
    }
}
