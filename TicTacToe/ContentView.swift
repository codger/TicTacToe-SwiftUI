//
//  ContentView.swift
//  TicTacToe
//
//  Created by John James Retina on 8/5/20.
//

import SwiftUI

var winRows = [[0,1,2],[3,4,5],[6,7,8], // Horizontal
               [0,3,6],[1,4,7],[2,5,8], // Vertical
               [0,4,8],[2,6,6]]         // Diagonal


struct ContentView: View {
  @State var squares = [ 1,1,0,2,2,1,0,1,2]
  @State var activePlayer = true
  @State var winner = false
  
  var body: some View {
    NavigationView {
      ZStack{
        Color(.darkGray)
        VStack{
          HStack{
            Text("Player Turn :")
            Square(shape: activePlayer == true ? 1 : 2)
              .stroke(activePlayer ? Color.red: Color.green, style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
              .background(Color.white)
              .cornerRadius(15)
              .aspectRatio(contentMode: .fit)
          }.foregroundColor(.white)
          .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 100)
          .font(.largeTitle)
          ForEach((0...2), id: \.self) { col in
            HStack{
              ForEach((0...2), id: \.self) { row in
                Square(shape: squares[row + 3 * col])
                  .stroke(squares[row + 3 * col] == 1 ? Color.red: Color.green, style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                  .background(Color.white)
                  .cornerRadius(15)
                  .aspectRatio(contentMode: .fit)
                  .onTapGesture(perform: {
                      if squares[row + 3 * col] == 0 && !winner{
                        squares[row + 3 * col] = activePlayer == true ? 1: 2
                        haveWinner()
                        activePlayer.toggle()
                      }
                  })
              }
            }
          }
          HStack{
            Text( winner ? "Have a winner" : "No Winner Yet")
              .font(.largeTitle)
              .background(Color.white)
          }
        }.padding()
      }
      .navigationBarTitle("Tic-tac-toe", displayMode: .inline)
      .navigationBarItems(trailing:
                            Button("🔄")
                            {
                              squares = [ 0,0,0,0,0,0,0,0,0]
                              winner = false
                            }
      )
    }
  }
  func squarePressed(num : Int) {
    print(num)
  }
  func haveWinner(){
    
    for row in winRows {
      print("\(squares[row[0]]) \(squares[row[1]]) \(squares[row[2]])")

      if squares[row[0]] == squares[row[1]] {
        if squares[row[0]] == squares[row[2]] {
          if squares[row[0]] != 0 {
            print("\(squares[row[0]]) \(squares[row[1]]) \(squares[row[2]])")
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
