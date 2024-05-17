//
//  QuestionView.swift
//  Country Flag Game
//
//  Created by Keila Islas on 5/16/24.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var gameManager: GameManager
    var body: some View {
        if gameManager.playingGame {
            VStack(spacing: 20, content: {
                HStack(content: {
                    Text("Country Flag Game")
                        .foregroundColor(.yellow)
                        .fontWeight(.heavy)
                    Spacer()
                    Text("\(gameManager.index) out of \(gameManager.questions.count)")
                        .foregroundColor(.yellow)
                })
                ProgressBar(progress: gameManager.progress)
                VStack(spacing: 10, content: {
                    Text("Which country's flag is this?")
                    Image(gameManager.country)
                        .resizable()
                        .frame(width: 300, height: 200)
                    ForEach(gameManager.answerChoices) { answer in
                        AnswerRow(answer: answer)
                            .environment(gameManager)
                    }
                })
                Button {
                    gameManager.goToNextQuestion()
                } label: {
                    CustomButton(text: "Next", background: gameManager.answerSelected ? .yellow : .gray)
                }
                .disabled(!gameManager.answerSelected)
                Spacer()
            })
            .padding()
            .background(.cyan)
        }
        else {
            VStack(spacing: 20, content: {
                Text("Country Flag Game")
                    .font(.title)
                Text("Congratulations! You have completed the game.")
                Text("You scored \(gameManager.score) out of \(gameManager.questions.count)")
                Button {
                    gameManager.reset()
                } label: {
                    CustomButton(text: "Play again")
                }
            })
            .foregroundColor(.yellow)
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.cyan)
        }
    }
}

#Preview {
    QuestionView()
}
