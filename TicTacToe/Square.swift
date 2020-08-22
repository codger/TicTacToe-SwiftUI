//
//  Square.swift
//  TicTacToe
//
//  Created by John James Retina on 8/5/20.
//

import SwiftUI

struct Square: Shape {
  var shape: Int
  func path(in rect: CGRect) -> Path {
    var path = Path()
    let inset: CGFloat = 20.0
    if shape == 1 {
      path.move(to: CGPoint(x: rect.minX + inset, y: rect.maxY - inset))
      path.addLine(to: CGPoint(x: rect.maxX - inset, y: rect.minY + inset))
      path.move(to: CGPoint(x: rect.minX + inset, y: rect.minY + inset))
      path.addLine(to: CGPoint(x: rect.maxX - inset, y: rect.maxY - inset))
    }
    else if shape == 2 {
      path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.midX - (inset), startAngle: Angle(radians: 0), endAngle: Angle(radians: .pi * 2), clockwise: true)
    }
    return path
  }
}

struct Square_Previews: PreviewProvider {
  static var previews: some View {
    GeometryReader { geom in
      HStack {
        Square(shape: 1)
          .stroke(Color.red, style: StrokeStyle(lineWidth: geom.size.width / 10.0, lineCap: .round, lineJoin: .round))
          .aspectRatio(1, contentMode: .fit)
        Square(shape: 0)
          .stroke(Color.red, style: StrokeStyle(lineWidth: geom.size.width / 10.0, lineCap: .round, lineJoin: .round))
          .aspectRatio(1, contentMode: .fit)
        Square(shape: 2)
          .stroke(Color.green, style: StrokeStyle(lineWidth: geom.size.width / 10.0, lineCap: .round, lineJoin: .round))
          .aspectRatio(1, contentMode: .fit)
      }
    }
  }
}
