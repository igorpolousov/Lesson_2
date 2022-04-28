//
//  ContentView.swift
//  Lesson_2
//
//  Created by Igor Polousov on 28.04.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            MyView()
            TextExamplesScroll()
        }
    }
}


// MyView Struct
struct MyView: View {
    var body: some View {
        Image("vinni1")
            .resizable()
            .ignoresSafeArea(.all)
            .padding(.bottom, 400)
        Image("bro")
            .resizable()
            .ignoresSafeArea(.all)
            .padding(.top, 360)
    }
}

// Cells struct text with scroll view

struct TextExamplesScroll: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                Text("Lesson 2 Examples")
                    .font(.largeTitle)
                    .foregroundColor(.cyan)
                    .border(.brown, width: 2)
                    .background(Color.mint)
                HStack {
                    TextBuilder {
                    Text("""
                             For creating additional view use this scheme:
                             struct MyView: View {
                                 var body: some View {
                                     Image("garden")
                                         .resizable()
                                         .ignoresSafeArea(.all)
                                 }
                             """)
                    }
                    TextBuilder {
                    Text("""
                             For creating debug function make extension:
                             extension View {
                             func debug() -> Self {
                             print(Mirror(reflecting: self).subjectType)
                             return self
                               }
                             }
                             """)
                    }
                }
            }
        }
    }
}

// View Modifier - используется для создания однотипных view, например кнопок

struct CircleShadow: ViewModifier {
    let shadowColor: Color
    let shadowRadius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .background(Circle()
                .fill(.white)
                .shadow(color: .red, radius: shadowRadius)
            )
    }
}

// View Builder - готовй модификатор. Смысл почти такой же как и View Modifier. Только в VM требуется задавать параметры, а в VB параметры уже заданы и применяются сразу
struct TextBuilder: View {
    var content: Text
    
    init(@ViewBuilder content: () -> Text) {
        self.content = content()
    }
    
    var body: some View {
        content
            .font(.system(size: 14))
            .frame(maxWidth: 300, maxHeight: 300)
            .foregroundColor(.red)
            .border(.cyan, width: 2)
            .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func debug() -> Self {
        print(Mirror(reflecting: self).subjectType)
        return self
    }
}
