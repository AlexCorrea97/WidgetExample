//
//  BottomExpandedView.swift
//  WidgetExample
//
//  Created by LUIS ALEJANDRO CORREA ROSADO on 26/07/23.
//

import SwiftUI
enum ExpandedStyle{
    case bottom
    case leading
    case trailing
    
}
struct ExpandedView: View {
    let style: ExpandedStyle
    
    var body: some View {
        switch style{
        case .bottom:
            BottomExpandedView()
            
        case .leading:
            LeadingExpandedView()
            
        case .trailing:
            Circle()
            
        }
            
    }
    struct LeadingExpandedView: View{
        var body: some View{
            VStack(alignment: .leading){
                
                Image("image_icon")
                    .resizable()
                    .frame(width: 110.12,height: 16)
                    .aspectRatio(contentMode: .fill)
                
                
                
                Text("Preparando tus productos ")
                    .font(.system(size: 12))
                    .fixedSize()
                    .bold()
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    struct BottomExpandedView: View{
        var body: some View{
            VStack {
                HStack{
                    circleWithImage(imageName: Constants.checkIconName, foregroundColor: Constants.blueColor)
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(Constants.blueColor)
                    circleWithImage(imageName: Constants.shoppingCartIconName, foregroundColor: Constants.blueColor)
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(Constants.blueColor)
                    circleWithImage(imageName: Constants.localShippingIconName, foregroundColor: Constants.blueColor)
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(Constants.blueColor)
                    circleWithImage(imageName: Constants.celebrationIconName, foregroundColor: Constants.blueColor)
                }
                Text("Llegada: 2:39 pm - 3:39 pm")
                    .foregroundColor(Color.white)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        private func circleWithImage(imageName: String, foregroundColor: Color)->some View{
            ZStack{
                Circle()
                    .frame(width: 40, height: 40)
                    .foregroundColor(foregroundColor)
                Image(imageName)
                    .renderingMode(.template)
                    .foregroundColor(Color(hex: 0xFFFFFF))
            }
            
        }
    }
    
}

struct ExpandedView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            ExpandedView(style: .bottom)
        }
    }
}
