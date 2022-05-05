//
//  ContentView.swift
//  Shared
//
//  Created by 李宇鸿 on 2022/5/4.
//

import SwiftUI

struct ContentView: View {
    // Log Status..
    // 日志状态. .
    @AppStorage("log_Status") var log_Status : Bool = false
    var body: some View {
//        OnBoardingPage()
//        Home()
        Group{
            if log_Status {
                MainPage()
            }
            else {
                OnBoardingPage()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


/**
 1.创建跨平台项目
 2. 添加字体 font
 3. 添加资源图片
 4. 设置info.plist的参数
 Application fonts resource path
 Fonts provided by application
 设置字体
 */
