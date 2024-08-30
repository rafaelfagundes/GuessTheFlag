//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Rafael Fagundes on 2024-08-28.
//

import SwiftUI

struct ContentView: View {
    private let numberOfFlags: Int = 3

    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var isShowingAnswer: Bool = false
    @State private var scoreTitle = "Wrong"
    @State private var score = 0
    @State private var totalClicks = 0
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(red: 0.03, green: 0.96, blue: 0.62), Color(red: 0.26, green: 0.02, blue: 0.49)], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            VStack(spacing: 30) {
                Spacer()
                logoView
                scoreView
                promptView

                ForEach(0..<numberOfFlags, id: \.self) { number in
                    flagButton(for: number)
                }
            }

            if isShowingAnswer {
                answerOverlay
            }
        }
    }
    
    private var scoreView: some View {
        Text("Score: \(score)/\(totalClicks)")
            .padding()
            .background(Color.white)
            .clipShape(Capsule())
    }
    
    private var logoView: some View {
        Image("gtf-logo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(.horizontal, 30)
    }
    
    private var promptView: some View {
        VStack {
            Text("Tap the flag of")
                .foregroundStyle(.white)
                .font(.subheadline.weight(.heavy))
            Text(countries[correctAnswer])
                .foregroundStyle(.white)
                .font(.largeTitle.weight(.semibold))
        }
    }
    
    private func flagButton(for number: Int) -> some View {
        Button {
            flagTapped(number)
        } label: {
            Image(countries[number])
                .resizable()
                .scaledToFit()
                .shadow(radius: 25)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
    
    private var answerOverlay: some View {
        Color.primary
            .background(.thinMaterial)
            .opacity(0.75)
            .ignoresSafeArea()
            .overlay(
                HStack {
                    Image(systemName: scoreTitle == "Correct" ? "checkmark.circle" : "x.circle")
                        .font(.system(size: 50))
                        .foregroundColor(.white)
                    
                    Text(scoreTitle)
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                }
                .padding()
                .background(scoreTitle == "Correct" ? Color.green : Color.red)
                .clipShape(Capsule())
                .shadow(radius: 10)
            )
    }
    
    private func flagTapped(_ number: Int) {
        totalClicks += 1
        if number == correctAnswer {
            score += 1
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }
        isShowingAnswer = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            askQuestion()
            isShowingAnswer = false
        }
    }
    
    private func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0..<numberOfFlags)
    }
}

#Preview {
    ContentView()
}
