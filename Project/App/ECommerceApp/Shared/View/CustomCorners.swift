//
//  CustomCorners.swift
//  ECommerceApp (iOS)
//
//  Created by 李宇鸿 on 2022/5/4.
//

import SwiftUI

// 定制的角落

struct CustomCorners: Shape {

    var corners : UIRectCorner
    var radius : CGFloat
    
    func path(in rect: CGRect) -> Path {
        //  通过贝塞尔画一个形状
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
}
