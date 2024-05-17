//
//  ContentView.swift
//  ViewsAndModifier
//
//  Created by CHOIJUNHYUK on 5/13/24.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.red)
            .padding()
            .background(.blue)
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct Watermark: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundStyle(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

struct NewText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundStyle(.red)
    }
}

extension View {
    func newTextStyle() -> some View {
        modifier(NewText())
    }
}

struct ContentView: View {
    var body: some View {
        Button("Click") {
            print(type(of: self.body))
        }
        VStack {
            Text("Title Style")
                .newTextStyle()
//                .titleStyle()
            
            Color.blue
                .frame(width: 300, height: 300)
                .watermarked(with: "This is the Watermark")
        }
    }
}

#Preview {
    ContentView()
}
