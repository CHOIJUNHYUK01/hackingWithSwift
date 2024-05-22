//
//  ContentView.swift
//  MultiplicationTableGame
//
//  Created by CHOIJUNHYUK on 5/22/24.
//

import SwiftUI

struct SectionTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundStyle(.gray)
            .multilineTextAlignment(.leading)
            .padding()
    }
}

struct SelectButton: ViewModifier {
    var bgColor: Color
    
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.bold())
            .frame(width: 40, height: 40)
            .buttonStyle(.bordered)
            .background(bgColor)
            .foregroundStyle(.white)
            .clipShape(.rect(cornerRadius: 10))
    }
}

extension View {
    func selectButtonStyle(bg: Color) -> some View {
        modifier(SelectButton(bgColor: bg))
    }
    
    func sectionTitleStyle() -> some View {
        modifier(SectionTitle())
    }
}

struct ContentView: View {
    @State private var path = NavigationPath()
    @State private var multiplicationValue = 2
    @State private var quizAmount = 5
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Spacer()
                
                VStack {
                    HStack {
                        Text("Select the multiplication table")
                            .sectionTitleStyle()
                        
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        
                        Button("-") {
                            if multiplicationValue > 2 {
                                multiplicationValue -= 1
                            }
                        }
                        .selectButtonStyle(bg: multiplicationValue == 2 ? .gray : .red)
                        .disabled(multiplicationValue == 2)
                        
                        Spacer()
                        
                        Text("\(multiplicationValue)")
                            .font(.largeTitle.bold())
                            .frame(width: 80)
                        
                        Spacer()
                        
                        Button("+") {
                            if multiplicationValue < 12 {
                                multiplicationValue += 1
                            }
                        }
                        .selectButtonStyle(bg: multiplicationValue == 12 ? .gray : .blue)
                        .disabled(multiplicationValue == 12)
                        
                        Spacer()
                    }
                }
                
                VStack {
                    HStack {
                        Text("Select the quiz amount")
                            .sectionTitleStyle()
                        
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        
                        Button("-") {
                            if quizAmount > 5 {
                                quizAmount /= 2
                            }
                        }
                        .selectButtonStyle(bg: quizAmount == 5 ? .gray : .red)
                        .disabled(quizAmount == 5)
                        
                        Spacer()
                        
                        Text("\(quizAmount)")
                            .font(.largeTitle.bold())
                            .frame(width: 80)
                        
                        Spacer()
                        
                        Button("+") {
                            if quizAmount < 20 {
                                quizAmount *= 2
                            }
                        }
                        .selectButtonStyle(bg: quizAmount == 20 ? .gray : .blue)
                        .disabled(quizAmount == 20)
                        
                        Spacer()
                    }
                }
                
                Spacer()
                
                //  Button(action: {
                //  path.append(QuizView(path: $path, multiplicationTable: $multiplicationValue, quizAmount: $quizAmount))
                //  }, label: {
                //      Text("Start")
                //          .font(.largeTitle.bold())
                //          .foregroundStyle(.white)
                //          .padding(.horizontal, 16)
                //  })
                //  .buttonStyle(.bordered)
                //  .background(.green)
                //  .clipShape(.capsule)
                
                NavigationLink(destination: QuizView(multiplicationTable: $multiplicationValue, quizAmount: $quizAmount)) {
                    Text("Start")
                        .font(.largeTitle.bold())
                }
                
                
                Spacer()
            }
            .navigationTitle("Home")
            // .navigationDestination(for: QuizView.self) { view in
            // view
            // }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
