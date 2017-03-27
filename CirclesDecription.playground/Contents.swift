//: Playground - noun: a place where people can play
import UIKit
import PlaygroundSupport

var astronomy = DescritiveCircle(name:"AS",
                                 descriptionText:"hui", color: .blue)

var it = DescritiveCircle(name:"IT",
                          descriptionText:"hui", color: .red)

var td = DescritiveCircle(name:"TD",
                          descriptionText:"hui", color: .green)

print("HUI")


var scene = CirclesScene(circles:[astronomy,it,td])

//var scene = UIView(frame: CGRect(x:0, y:0, width: 200, height: 300))
//scene.backgroundColor = .red
PlaygroundPage.current.liveView = scene
PlaygroundPage.current.needsIndefiniteExecution = true




