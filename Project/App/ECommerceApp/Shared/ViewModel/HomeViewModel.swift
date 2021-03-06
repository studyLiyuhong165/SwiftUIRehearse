//
//  HomeViewModel.swift
//  ECommerceApp (iOS)
//
//  Created by 李宇鸿 on 2022/5/6.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var productType : ProductType = .Wearable
    
    @Published var products: [Product] = [
    
        Product(type: .Wearable, title: "Apple Watch", subtitle: "Series 6: Red", price: "$359",productImage: "AppleWatch6"),
        Product(type: .Wearable, title: "Samsung Watch", subtitle: "Gear: Black", price: "$180", productImage: "SamsungWatch"),
        Product(type: .Wearable, title: "Apple Watch", subtitle: "Series 4: Black", price: "$250", productImage: "AppleWatch4"),
        Product(type: .Phones, title: "iPhone 13", subtitle: "A15 - Pink", price: "$699", productImage: "iPhone13"),
        Product(type: .Phones, title: "iPhone 12", subtitle: "A14 - Blue", price: "$599", productImage: "iPhone12"),
        Product(type: .Phones, title: "iPhone 11", subtitle: "A13 - Purple", price: "$499", productImage: "iPhone11"),
        Product(type: .Phones, title: "iPhone SE 2", subtitle: "A13 - White", price: "$399", productImage: "iPhoneSE"),
        Product(type: .Laptops, title: "MacBook Air", subtitle: "M1 - Gold", price: "$999", productImage: "MacBookAir"),
        Product(type: .Laptops, title: "MacBook Pro", subtitle: "M1 - Space Grey", price: "$1299", productImage: "MacBookPro"),
        Product(type: .Tablets, title: "iPad Pro", subtitle: "M1 - Silver", price: "$999", productImage: "iPadPro"),
        Product(type: .Tablets, title: "iPad Air 4", subtitle: "A14 - Pink", price: "$699", productImage: "iPadAir"),
        Product(type: .Tablets, title: "iPad Mini", subtitle: "A15 - Grey", price: "$599", productImage: "iPadMini"),
        Product(type: .Laptops, title: "iMac", subtitle: "M1 - Purple", price: "$1599", productImage: "iMac"),
    ]

    // fillered Products...
    // 填料产品…
    @Published var fillteredProducts : [Product] = []
    
    
    // More products on the type...
    //  更多的产品类型…
    @Published var showMoreProductsOnType : Bool = false
    
    
    
    init(){
        fillterProductByType()
    }
    
    func fillterProductByType(){
        // Filltering Product By Product Type...
        //  过滤产品按产品类型…
        DispatchQueue.global(qos: .userInitiated).async {
            //Since it will require more memory so were using lazy to preform more ...
            // 因为它需要更多的内存，所以我们使用lazy来执行更多…
            let results = self.products
                .lazy
                .filter { product in
                    return product.type == self.productType
                }
            // Limiting result ....
            // 限制结果……
                .prefix(4)
            
            DispatchQueue
                .main.async {
                    self.fillteredProducts = results.compactMap({ product in
                        return product
                    })
                }
        }
    }
    
}




