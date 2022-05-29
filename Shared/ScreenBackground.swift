//
//  ScreenBackground.swift
//  SimpleToDoApp
//
//  Created by Herie Marie A. Estaño on 4/15/22.
//

import SwiftUI

struct ScreenBackground: View {
    
    var body: some View {
        
        LinearGradient(gradient: Gradient(colors: [.green, .blue, .white]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
    }
}

struct ScreenBackground_Previews: PreviewProvider {
    static var previews: some View {
        ScreenBackground()
    }
}
