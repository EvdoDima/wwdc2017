import Foundation
import UIKit

let sceneWidth:CGFloat = 400
let sceneHeight:CGFloat = 600

public class CirclesScene:UIView {
    var circles: [DescritiveCircle]
    private var animator: UIDynamicAnimator?
    private var intersectionLayer: CAShapeLayer! = CAShapeLayer()
    
    public init(circles: [DescritiveCircle]) {
        self.circles = circles
        super.init(frame: CGRect(x:0, y:0, width:sceneWidth, height:sceneHeight))
        self.animator = UIDynamicAnimator(referenceView: self)
        self.backgroundColor = .white
        
        
        for circle in circles {
            self.addSubview(circle)
            let myPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(myPanAction))
            
            myPanGestureRecognizer.minimumNumberOfTouches = 1
            myPanGestureRecognizer.maximumNumberOfTouches = 1
            circle.addGestureRecognizer(myPanGestureRecognizer)
        }
        
        self.layer.addSublayer(intersectionLayer)
    }
    
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func myPanAction(recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self)
        if let myView = recognizer.view {
            myView.center = CGPoint(x: myView.center.x + translation.x, y: myView.center.y + translation.y)
        }
        recognizer.setTranslation(.zero, in: self)
       
      //  intesectLayer = getIntersectionView(circle1: circles[0], circle2: circles[1])
       // intesectLayer.removeFromSuperlayer()
       // self.layer.addSublayer(intesectLayer)
        
        let tempLayer = getIntersectionView(circle1: circles[0], circle2: circles[1])
        intersectionLayer.removeFromSuperlayer()
        self.layer.addSublayer(tempLayer)
        intersectionLayer = tempLayer
    }
    
   override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let touchLocation = touch.location(in: superview)
            for circle in circles {
                if (circle.frame.contains(touchLocation)) {
                    self.bringSubview(toFront: circle)
                   
                }
            }
    }
    //self.bringSubview(toFront: intersectionView)
    }
    
    func getIntersectionView(circle1: DescritiveCircle, circle2: DescritiveCircle) -> CAShapeLayer {

        let y_dif = circle2.center.y - circle1.center.y
        let x_dif = circle2.center.x - circle1.center.x
        let distance = sqrt(y_dif * y_dif + x_dif * x_dif)

        if (distance > circleRadius * 2){
            print("far")
            return CAShapeLayer()
        }
        
        let intersectionCenter = distance/2
        
        let innerAngle = acos(intersectionCenter/circleRadius)
        var outterAngle = atan(y_dif/x_dif)
        print(" outter :\(outterAngle)")
        print(" inner:\(innerAngle) \n")
        if outterAngle.isNaN{
            outterAngle = 0.0
        }
        if x_dif < 0 {
            outterAngle = CGFloat(M_PI) + outterAngle
            
        }
        
        let intersectionPath = UIBezierPath()
        intersectionPath.addArc(withCenter: circle1.center, radius: circleRadius, startAngle: outterAngle - innerAngle, endAngle: outterAngle + innerAngle, clockwise: true)
        
        outterAngle = CGFloat(M_PI) + outterAngle
        intersectionPath.addArc(withCenter: circle2.center, radius: circleRadius, startAngle: outterAngle - innerAngle, endAngle: outterAngle + innerAngle, clockwise: true)
        intersectionPath.close()
        
        let layer = CAShapeLayer()
        layer.path  = intersectionPath.cgPath
        layer.strokeColor = UIColor.blue.cgColor
        layer.fillColor = UIColor.white.cgColor
        layer.lineWidth = 1.0
        
        return layer
    }
    
}
