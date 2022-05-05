//
//  Product.swift
//  ECommerceApp (iOS)
//
//  Created by 李宇鸿 on 2022/5/6.
//

import SwiftUI


// Product Model ....
// 产品 模型
struct Product: Identifiable,Hashable {
    var id = UUID().uuidString
    var type: ProductType
    var title: String
    var subtitle: String
    var description: String = ""
    var price: String
    var productImage: String = ""
    var quantity: Int = 1
}


// Product Types ...
// 产品类型……
enum ProductType : String, CaseIterable {
    case Wearable = "Wearable"
    case Laptops = "Laptops"
    case Phones = "Phones"
    case Tablets = "Tablets"

}
