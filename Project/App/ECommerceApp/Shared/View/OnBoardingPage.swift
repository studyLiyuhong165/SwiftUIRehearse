//
//  OnBoardingPage.swift
//  ECommerceApp (iOS)
//
//  Created by 李宇鸿 on 2022/5/4.
//

// 新用户启动页面

/**
  1 设置页面
  2 设置颜色
  3 设置字体 并且设置自定义字体
  4 设置按钮
  5 调整间距
  6 设置预览机型
  7 获取屏幕的尺寸 进行机型的处理 比如头部间距 按钮间距
 */


// To Use the custom font on all page ...
// 使用自定义字体 用于全部的页面
let customFont = "Raleway-Regular"

import SwiftUI

struct OnBoardingPage: View {
    
    // showing Login Page ...
    // 显示登录页面…
    @State var showLoginPage : Bool = false
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Find your\nGadget")
                .font(.custom(customFont, size: 55))
            // Since we added all three fonts in info.plist
            // we can call all of those fonts with any names....
            //因为我们在info.plist中添加了这三种字体
            //我们可以将所有这些字体命名为....
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            // 加载图片 设置调整大小 并且调整图片的横纵比例为合适(.fit)
            Image("OnBoard")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            
            //
            Button {
                withAnimation {
                    showLoginPage = true
                }
            } label: {
                Text("Get started")
                    .font(.custom(customFont, size: 18))
                    .fontWeight(.semibold)
                    .padding(.vertical,18)
                    .frame(maxWidth:.infinity)
                    .background(.white)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                    .foregroundColor(Color("Purple"))
            }
            .padding(.horizontal,30)
            // Adding Some Adjustments only for layger displays ....
            // 添加一些调整仅为layger显示....
            // 根据屏幕尺寸 设置y的偏移量
            .offset(y:getRect().height < 750 ? 20 : 40)
//            .offset(y:20)
            Spacer()
            
        }
        .padding()
        .padding(.top,getRect().height < 750 ? 0 : 20)
        .frame(maxWidth:.infinity,maxHeight: .infinity)
        .background(
            Color("Purple")
        )
        .overlay(
            Group {
                if showLoginPage{
                    LoginPage().transition(.move(edge: .bottom))
                }
            }
        )
    }
}

struct OnBoardingPage_Previews: PreviewProvider {
    static var previews: some View {
        // 设置预览的机型
//        OnBoardingPage()
//            .previewDevice("iPhone 12")
//
//        OnBoardingPage()
//            .previewDevice("iPhone 8")
        
        OnBoardingPage()

    }
}


// Extending View to get Screen Bounds
extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}
