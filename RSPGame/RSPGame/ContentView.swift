//
//  ContentView.swift
//  RSPGame
//
//  Created by CHOIJUNHYUK on 5/17/24.
//

import SwiftUI

struct ContentView: View {
    @State private var computer = Int.random(in: 0...2)
    @State private var result = Int.random(in: 0...2)
    @State private var selectAnswer = 0
    @State private var score = 0
    
    @State private var showingScore = false
    @State private var finishGame = false
    @State private var scoreTitle = ""
    @State private var questions = 1
    
    var answer: Int {
        switch result {
        case 0:
            // Win
            switch computer {
            case 0: // R
                return 2
            case 1: // S
                return 0
            case 2: // P
                return 1
            default:
                return 0
            }
        case 1:
            // Draw
            switch computer {
            case 0: // R
                return 0
            case 1: // S
                return 1
            case 2: // P
                return 2
            default:
                return 0
            }
        case 2:
            // Lose
            switch computer {
            case 0: // R
                return 1
            case 1: // S
                return 2
            case 2: // P
                return 0
            default:
                return 0
            }
        default:
            return 0
        }
    }
    
    let rsp = ["Rock", "Scissors", "Paper"]
    let results = ["Win", "Draw" ,"Lose"]
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.black, .blue], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("RSP GAME")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                VStack(spacing: 16) {
                    Text("Choose the RSP")
                        .font(.subheadline.weight(.heavy))
                        .foregroundStyle(.secondary)
                    
                    Text("Enemy Choose : \(rsp[computer])")
                        .font(.title2.weight(.medium))
                        .foregroundStyle(.black)
                    
                    Text("Expected Result : \(results[result])")
                        .font(.title2.weight(.medium))
                        .foregroundStyle(.black)
                    
                    ForEach(0..<3) { number in
                        Button {
                            tapAnswer(number)
                            selectAnswer = number
                        } label: {
                            Text(rsp[number])
                                .frame(maxWidth: .infinity)
                                .font(.headline.bold())
                                .padding()
                        }
                        .buttonStyle(.bordered)
                        .padding()
                    }
                }
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                
                Text("Score : \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            if scoreTitle == "Correct" {
                Text("Your Score is \(score)")
            } else {
                Text("You should have chosen \(rsp[answer])")
            }
        }
        .alert("Finish", isPresented: $finishGame) {
            Button("Restart", action: {
                score = 0
                finishGame = false
                questions = 0
                askQuestion()
            })
        } message: {
            Text("Your Final Score is \(score)")
        }
    }
    
    func tapAnswer(_ pick: Int) {
        if pick == answer { correctAction() }
        else { wrongAction() }
        
        showingScore = true
    }
    
    func correctAction() {
        scoreTitle = "Correct"
        score += 1
    }
    
    func wrongAction() {
        scoreTitle = "Wrong"
    }
    
    func askQuestion() {
        if questions == 10 {
            finishGame = true
            return
        }
        
        questions += 1
        result = Int.random(in: 0...2)
        computer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
