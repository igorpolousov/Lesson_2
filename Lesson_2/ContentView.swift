//
//  ContentView.swift
//  Lesson_2
//
//  Created by Igor Polousov on 28.04.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MyView()
    }
}


struct MyView: View {
    var body: some View {
        Image("bro")
            .resizable()
            .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
