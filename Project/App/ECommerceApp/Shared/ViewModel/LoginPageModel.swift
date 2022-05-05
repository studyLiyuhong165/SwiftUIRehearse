//
//  LoginPageModel.swift
//  ECommerceApp (iOS)
//
//  Created by 李宇鸿 on 2022/5/4.
//

import SwiftUI

/**
 ObservableObject - 可观察对象
 https://developer.apple.com/documentation/combine/observableobject
 一种具有发布者的对象，在对象更改之前发出。
 
 
 这个对象可以给多个独立的 View 使用。
 如果你用 @ObservedObject 来修饰一个对象，那么那个对象必须要实现 ObservableObject 协议，
 然后用 @Published 修饰对象里属性，表示这个属性是需要被 SwiftUI 监听的

 */
class LoginPageModel : ObservableObject {
    

    
    // Login Properties...
    // 登录属性
    @Published var email : String = ""
    @Published var password : String = ""
    @Published var showPassword : Bool = false

    // Register Properties
    // 注册属性
    @Published var registerUser : Bool = false
    @Published var re_Enter_Password : String = ""
    @Published var showReEnterPassword : Bool = false

    
    // Log Status ...
    // 日志状态. .
    @AppStorage("log_Status") var log_Status : Bool = false

    //Login Call
    // 登录调用
    func Login(){
        // Do Action Here...
        // 在这里做动作…
        withAnimation {
            log_Status = true
        }
    }
    //
    func Register(){
        // Do Action Here...
        // 在这里做动作…
        withAnimation {
            log_Status = true
        }

    }
    
    func ForgotPassword(){
        // Do Action Here...
        // 在这里做动作…
    }
    
}
