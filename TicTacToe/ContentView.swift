//
//  ContentView.swift
//  TicTacToe
//
//  Created by John James Retina on 8/5/20.
//

import SwiftUI

var winRows = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8], // Horizontal
  [0, 3, 6], [1, 4, 7], [2, 5, 8], // Vertical
  [0, 4, 8], [2, 4, 6]] // Diagonal


struct ContentView: View {
  @State var squares = [0, 1, 0, 2, 2, 1, 0, 1, 2]
  @State var player1Turn = true
  @State var winner = false

  var body: some View {
    NavigationView {
      ZStack {
        Color(.darkGray)
        VStack {
          HStack {
            Text("Player Turn :")
            Square(shape: player1Turn == true ? 1 : 2)
              .stroke(player1Turn ? Color.red : Color.green, style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
              .background(Color.white)
              .cornerRadius(15)
              .aspectRatio(contentMode: .fit)
          }.foregroundColor(.white)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 100)
            .font(.largeTitle)
          ForEach((0...2), id: \.self) { col in
            HStack {
              ForEach((0...2), id: \.self) { row in
                Square(shape: squares[row + 3 * col])
                  .stroke(squares[row + 3 * col] == 1 ? Color.red : Color.green, style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                  .background(Color.white)
                  .cornerRadius(15)
                  .aspectRatio(contentMode: .fit)
                  .onTapGesture(perform: {
                    if squares[row + 3 * col] == 0 && !winner {
                      squares[row + 3 * col] = player1Turn == true ? 1 : 2
                      haveWinner()
                      player1Turn.toggle()
                    }
                  })
              }
            }
          }
          HStack {
            Text(winner ? "Have a winner" : "No Winner Yet")
              .font(.largeTitle)
              .background(Color.white)
          }
        }.padding()
      }
        .navigationBarTitle("Tic-tac-toe", displayMode: .inline)
        .navigationBarItems(trailing:
            Button(action: {
              squares = [0, 0, 0, 0, 0, 0, 0, 0, 0]
              winner = false
            }, label: { Image(systemName: "arrow.counterclockwise") })
            .font(.system(size: 40, weight: .bold, design: .default))
            .offset(x: 0, y: -10)
        )
    }.onAppear {
      haveWinner()
    }
  }

  func haveWinner() {
    for row in winRows {
      if squares[row[0]] == squares[row[1]] {
        if squares[row[0]] == squares[row[2]] {
          if squares[row[0]] != 0 {
            winner = true
          }
        }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
