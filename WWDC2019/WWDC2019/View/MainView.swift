//
//  MainView.swift
//  WWDC2019
//
//  Created by Eunyeong Kim on 2019/07/05.
//  Copyright © 2019 Eunyeong Kim. All rights reserved.
//

import SwiftUI

struct MainView : View {

    @State var informationText = "ログインしてください！"
    @State var isUser = false

    private var suicaStack = VStack {
        Image("welcome_suica")
            .padding(5.0)
        Text("こんにちは！")
            .font(.title)
            .padding(5.0)
    }

    var body: some View {
        VStack {
            suicaStack
            Text(informationText)
                .font(.footnote)
            if !isUser {
                SignInButtonView(completion: {
                    self.isUser = true
                    self.informationText = "👮‍♀️ログイン成功です👮‍♀️"
                }).frame(width: 280, height: 60, alignment: .center)
            }
        }
    }

}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
#endif
