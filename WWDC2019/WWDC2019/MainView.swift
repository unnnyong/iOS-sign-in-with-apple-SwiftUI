//
//  MainView.swift
//  WWDC2019
//
//  Created by Eunyeong Kim on 2019/07/05.
//  Copyright © 2019 Eunyeong Kim. All rights reserved.
//

import SwiftUI

struct MainView : View {

    let button = Button(action: {
        print("hello")
    }, label: {
        Text("Button")
    })

    var body: some View {
        VStack {
            Text("Hello World")
            Text("Placeholder")
            button
        }
    }

}

private extension ContentView {

}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
