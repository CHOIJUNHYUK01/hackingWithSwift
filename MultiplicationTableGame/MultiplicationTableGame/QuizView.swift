//
//  SecondView.swift
//  MultiplicationTableGame
//
//  Created by CHOIJUNHYUK on 5/22/24.
//

import SwiftUI

struct QuizView: View {
//    @Binding var path: NavigationPath
    @Environment(\.dismiss) private var dismiss
    
    @Binding var multiplicationTable: Int
    @Binding var quizAmount: Int
    
    @State private var quiz = 1
    @State private var score = 0
    @State private var randomInt = Int.random(in: 2..<100)
    @State private var answer = ""
    @FocusState private var typing: Bool
    
    @State private var showAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var isDone = false
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                Spacer()
                
                Text("\(multiplicationTable)")
                    .font(.system(size: 50).bold())
                    .frame(width: 100)
                
                Spacer()
                
                Text("X")
                    .font(.title)
                
                Spacer()
                
                Text("\(randomInt)")
                    .font(.system(size: 50).bold())
                    .frame(width: 100)
                
                Spacer()
            }
            
            HStack {
                Text("=")
                    .font(.title)
                
                TextField("Answer", text: $answer)
                    .frame(width: 100, height: 100)
                    .background(.regularMaterial)
                    .multilineTextAlignment(.center)
                    .border(.black)
                    .onReceive(answer.publisher.collect(), perform: {
                        answer = String($0.prefix(4))
                    })
                    .keyboardType(.numberPad)
                    .focused($typing)
            }
            
            Spacer()
            
            Button(action: {
                submitTheAnswer()
            }, label: {
                Text("Submit")
                    .font(.title.bold())
                    .foregroundStyle(.white)
                    .padding(.horizontal, 20)
            })
            .buttonStyle(.bordered)
            .background(.green)
            .clipShape(.capsule)
            .padding(.bottom, 40)
        }
        .toolbar {
            if typing {
                Button("Done") {
                    typing.toggle()
                }
            }
        }
        .alert(alertTitle, isPresented: $showAlert) {
            Button("Next") { nextQuiz() }
        } message: {
            Text("\(alertMessage)")
        }
        .alert(alertTitle, isPresented: $isDone) {
            HStack {
                Button(role: .cancel) {
                    dismiss()
                    isDone = false
                } label: {
                    Text("Done")
                }

                Button("Restart") {
                    quiz = 0
                    score = 0
                    nextQuiz()
                    isDone = false
                }
            }
        } message: {
            Text("\(alertMessage)")
        }
    }
    
    func submitTheAnswer() {
        guard let answer = Int(answer) else { return }
        showAlert = true
        if answer == multiplicationTable * randomInt {
            alertTitle = "Correct"
            score += 1
            alertMessage = "Your score is \(score)"
        } else {
            alertTitle = "Wrong"
            alertMessage = "\(multiplicationTable) X \(randomInt) = \(multiplicationTable * randomInt)"
        }
    }
    
    func nextQuiz() {
        answer = ""
        quiz += 1
        
        if(quiz > quizAmount) {
            alertTitle = "Finish"
            alertMessage = "Your Final Score is \(score)"
            
            isDone = true
        }
        
        randomInt = Int.random(in: 2..<100)
        showAlert = false
    }
    
    // Hashable 프로토콜을 준수하기 위한 구현
//    static func == (lhs: QuizView, rhs: QuizView) -> Bool {
//        return true
//    }
//    
//    func hash(into hasher: inout Hasher) {
//        hasher.combine("QuizView")
//    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView(multiplicationTable: .constant(2), quizAmount: .constant(10))
    }
}
