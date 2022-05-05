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
        // 贝塞尔曲线 可以参考
        // https://baike.baidu.com/item/%E8%B4%9D%E5%A1%9E%E5%B0%94%E6%9B%B2%E7%BA%BF/1091769
        // http://www.demodashi.com/demo/11981.html
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
}
