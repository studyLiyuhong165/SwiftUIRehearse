//
//  LoginPage.swift
//  ECommerceApp (iOS)
//
//  Created by 李宇鸿 on 2022/5/4.
//

import SwiftUI

/**
 StateObject - 状态对象
 https://developer.apple.com/documentation/swiftui/stateobject
 实例化可观察对象的属性包装器类型。

 */

struct LoginPage: View {
    @StateObject var loginData : LoginPageModel = LoginPageModel()
    
    var body: some View {
        VStack {
            VStack {
                Text("Welocome\nback")
                    .font(.custom(customFont,size:55).bold())
                    .foregroundColor(.white)
                    .frame(maxWidth:.infinity,alignment: .leading)
                    .frame(height:getRect().height / 3.5)
                    .padding()
                    .background(
                        ZStack{
                            // 渐变的圆圈
                            LinearGradient(colors:
                                            [Color("LoginCircle"),
                                           Color("LoginCircle").opacity(0.8),
                                           Color("Purple")],
                                           startPoint: .top,
                                           endPoint: .bottom)
                            .frame(width:100,height:100)
                            .clipShape(Circle())
                            .frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .topTrailing)
                            .offset(y:-25)
                            .ignoresSafeArea()
                            
                            
                            Circle()
                                .strokeBorder(Color.white.opacity(0.3),lineWidth: 3)
                                .frame(width:30,height: 30)
                                .blur(radius: 2)
                                .frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .bottomTrailing)
                                .padding(30)
                            
                            
                            Circle()
                                .strokeBorder(Color.white.opacity(0.3),lineWidth: 3)
                                .frame(width:23,height: 23)
                                .blur(radius: 2)
                                .frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .topLeading)
                                .padding(.leading, 30)

                        }
                    )
            }
            
            ScrollView(.vertical,showsIndicators: false){
                // Login Page form ...
                // 登录页面表单…
                
                VStack(spacing: 15){
                    Text(loginData.registerUser ? "register" : "Login")
                        .font(.custom(customFont, size: 22).bold())
                        .frame(maxWidth:.infinity,alignment: .leading)
                    
                    // Custom TextField
                    // 自定义 输入文本框
                    CustomTextField(icon: "envelope", title: "Email", hint: "Justine@gmail.com", value: $loginData.password, showPassword: .constant(false))
                        .padding(.top,30)
                    
                    CustomTextField(icon: "lock", title: "Password", hint: "123456", value: $loginData.email, showPassword: $loginData.showPassword)
                        .padding(.top,10)
                    

                    // Register Reenter Password
                    // 重新注册密码
                    if loginData.registerUser {
                        CustomTextField(icon: "lock", title: "Re-Enter Password", hint: "123456", value: $loginData.re_Enter_Password, showPassword: $loginData.showReEnterPassword)
                            .padding(.top,10)
                    }
                    
                    // Forgot Password button
                    // 忘记密码按钮
                    Button {
                        loginData.ForgotPassword()
                    } label: {
                        Text("Forgot Password")
                            .font(.custom(customFont, size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(Color("Purple"))
                    }
                    .padding(8)
                    .frame(maxWidth:.infinity,alignment: .leading)
                    
                    // Login Button
                    // 登录按钮
                    Button {
                        if loginData.registerUser {
                            loginData.Register()
                        }
                        else {
                            loginData.Login()
                        }
                    } label: {
                        Text("Login")
                            .font(.custom(customFont, size: 17).bold())
                            .padding(.vertical,20)
                            .frame(maxWidth:.infinity)
                            .foregroundColor(.white)
                            .background(Color("Purple"))
                            .cornerRadius(15)
                            .shadow(color: .black.opacity(0.07), radius: 5, x: 5, y: 5)
                    }
                    .padding(25)
                    .padding(.vertical)
                    
                    
                    // Register User Button
                    // 注册按钮
                    Button {
                        withAnimation {
                            loginData.registerUser.toggle()
                        }
                    } label: {
                        Text(loginData.registerUser ? "Black to login" : "Create Account")
                            .font(.custom(customFont, size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(Color("Purple"))
                    }
                    .padding(8)

                    
                }
                .padding(30)
            }
            .frame(maxWidth:.infinity,maxHeight: .infinity)
            .background(Color.white
                .clipShape(CustomCorners(corners: [.topLeft,.topRight], radius: 25))
                .ignoresSafeArea() //忽略安全区域
            )
            
            
            
        }
        .frame(maxWidth:.infinity,maxHeight: .infinity)
        .background(Color("Purple"))
        
        // clearing data when changes ...
        // 变更时清理数据……
        .onChange(of: loginData.registerUser) { newValue in
            loginData.email = ""
            loginData.password = ""
            loginData.re_Enter_Password = ""
            loginData.showPassword = false
            loginData.showReEnterPassword = false
            
        }
        
    }
    
    
    @ViewBuilder
    func CustomTextField(icon : String, title : String,hint: String,value: Binding<String>,showPassword: Binding<Bool>) -> some View {
        VStack(alignment: .leading, spacing: 12) {
        
            Label {
                Text(title)
                    .font(.custom(customFont, size: 14))
            } icon: {
                Image(systemName: icon)
            }
            .foregroundColor(Color.black.opacity(0.8))
            
            if title.contains("Password")  && !showPassword.wrappedValue {
                SecureField(hint,text:value)
                    .padding(.top,2)

                
            }else
            {
                TextField(hint,text:value)
                    .padding(.top,2)

            }
            
            Divider()
                .background(Color.black.opacity(0.4))

            
            
        }
        // Showing show Button for password field ...
        // overlay 覆盖
        .overlay(
   
            Group{
                if title.contains("Password"){
                    Button(action: {
                        showPassword.wrappedValue.toggle()
                    }, label: {
                        
                        Text(showPassword.wrappedValue ? "Hide" : "Show")
                            .font(.custom(customFont, size: 13).bold())
                            .foregroundColor(Color("Purple"))
                        
                        
                    }).offset(y:8)
                }
            }
            
            ,alignment: .trailing
        )
        
        
        
    }
    
    
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
//        LoginPage()
//            .previewDevice("iPhone 12")
//        LoginPage()
//            .previewDevice("iPhone 8")
    }
}
