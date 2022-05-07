//
//  CustomTabbar.swift
//  CustomTabbar
//
//  Created by 李宇鸿 on 2022/5/3.
//

import SwiftUI

struct CustomTabbar: View {
    @Binding var currentTab : Tab
    
    // MARK : To Animate Like Curve
    // 动画曲线
    @State var yOffset : CGFloat = 0
    var body: some View {
        GeometryReader{ proxy in
            // 获取整体的宽度
            let width = proxy.size.width
            HStack(spacing:0) {
                ForEach(Tab.allCases,id:\.rawValue){tab in
                    Button {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            currentTab = tab
                            yOffset = -60
                        }
                        withAnimation(.easeInOut(duration: 0.1).delay(0.07)){
                            
                            yOffset = 0
                        }
                    } label: {
                        Image(tab.rawValue)
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:30,height: 30)
                            .frame(maxWidth:.infinity)
                            .foregroundColor(currentTab == tab ? Color("Purple"):.gray)
                        
                        // MARK : Little Scaling Effect
                        // 图表一个缩放动画效果
                            .scaleEffect(currentTab == tab && yOffset != 0 ? 1.5 : 1)
                    }

                }
            }
            .frame(maxWidth:.infinity)
            .background(alignment:.leading){
                Circle()
                    .fill(Color("Yellow"))
                    .frame(width:25,height:25)
                    .offset(x:10,y:yOffset)
                    .offset(x:indicatorOffset(witdh: width))
            }
            
        }
        .frame(height:30)
        .padding(.bottom,10)
        .padding([.horizontal,.top])
    }
    // MARK: Indicator Offset
    // 指示器偏移
    func indicatorOffset(witdh : CGFloat) ->CGFloat {
        let index = CGFloat(getIndex())
        if index == 0 {return 0}
        
        let buttonWidth = witdh / CGFloat(Tab.allCases.count)
        return index * buttonWidth
    }
    func getIndex() -> Int {
        switch currentTab {
        case .home:
            return 0
        case .label:
            return 1
        case .position:
            return 2
        case .found:
            return 3
        case .my:
            return 4
        }
    }
}

struct CustomTabbar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
