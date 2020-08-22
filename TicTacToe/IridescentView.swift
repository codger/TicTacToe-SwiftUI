//
//  IridescentView.swift
//  TicTacToe
//
//  Created by John James Retina on 8/16/20.
//

import SwiftUI

struct IridescentView: View {
  @State var x : CGFloat = 0
  @State var degree : Double = 0
  let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect
  @State var gradient : [Color] = [Color(#colorLiteral(red: 0.9700688617, green: 0.8329559691, blue: 1, alpha: 1)),
      Color(#colorLiteral(red: 0.8432452348, green: 0.8160916593, blue: 1, alpha: 1)),
      Color(#colorLiteral(red: 0.8097396214, green: 0.945347698, blue: 1, alpha: 1)),
      Color(#colorLiteral(red: 0.8435950414, green: 1, blue: 0.8943966345, alpha: 1))]
  var animatablePair : AnimatablePair<CGFloat,Double>{
          get { AnimatablePair(x,degree) }
          set {
              x = newValue.first
              degree = newValue.second
          }
      }
  
    var body: some View {
      ZStack {
                  RoundedRectangle(cornerRadius: 40)
                      .fill(LinearGradient(gradient: Gradient(colors: gradient),
                                           startPoint:  UnitPoint(x: 0, y: 1),
                                           endPoint: UnitPoint(x: x, y: 0)))
                      .frame(width: 300, height: 300)
                      
                   Text("Colors")
                      .foregroundColor(Color(#colorLiteral(red: 0.8435950414, green: 1, blue: 0.8943966345, alpha: 1)).opacity(0.35))
                      .font(.system(size: 50))
                      .bold()
      }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0.0, y: 1.0, z: 0.0))
    }
}

struct IridescentView_Previews: PreviewProvider {
    static var previews: some View {
        IridescentView()
    }
}
