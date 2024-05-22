//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by CHOIJUNHYUK on 5/13/24.
//

import SwiftUI

struct FlagImage: View {
    var country: String
    
    var body: some View {
        Image(country)
            .clipShape(.capsule)
            .shadow(radius: 5)
    }
}
struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"]
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var selectAnswer = -1
    
    @State private var showingScore = false
    @State private var finishGame = false
    @State private var scoreTitle = ""
    @State private var questions = 1
    @State private var score = 0
    
    @State private var animationAmount = [0.0, 0.0, 0.0]
    @State private var scaleAmount = 1.0
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green:0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .font(.subheadline.weight(.heavy))
                            .foregroundStyle(.secondary)
                        
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                            .foregroundStyle(.black)
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                            selectAnswer = number
                            scaleAmount -= 0.2
                            animationAmount[number] += 360
                        } label: {
                            FlagImage(country: countries[number])
                                .rotation3DEffect(
                                    .degrees(animationAmount[number]),
                                    axis: (x: 0.0, y: 1.0, z: 0.0)
                                )
                                .opacity((selectAnswer > -1 && selectAnswer != number) ? 0.25 : 1.0)
                                .scaleEffect((selectAnswer > -1 && selectAnswer != number) ? scaleAmount : 1.0)
                                .animation(.default, value: scaleAmount)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
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
                if selectAnswer >= 0 {
                    Text("That's the flag of \(countries[selectAnswer])")
                }
            }
        }
        .alert("Finish", isPresented: $finishGame) {
            Button("Restart", action: {
                score = 0
                finishGame = false
                scaleAmount = 1.0
                questions = 0
                selectAnswer = -1
                askQuestion()
            })
        } message: {
            Text("Your Score is \(score)")
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong"
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        if questions == 8 {
            finishGame = true
            return
        }
        questions += 1
        scaleAmount = 1.0
        selectAnswer = -1
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
