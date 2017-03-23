//: Playground - noun: a place where people can play
import UIKit
import PlaygroundSupport


var astronomy = DescritiveCircle(name:"Astro", descriptionText:"hui", color: .blue)

var it = DescritiveCircle(name:"IT", descriptionText:"hui", color: .red)


var scene = CirclesScene(circles:[astronomy, it])


PlaygroundPage.current.liveView = scene



