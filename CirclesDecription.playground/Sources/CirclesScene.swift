import Foundation
import UIKit

let sceneWidth:CGFloat = 800
let sceneHeight:CGFloat = 600

public class CirclesScene:UIView {
    var circles: [DescritiveCircle]
    private var animator: UIDynamicAnimator?
    private var snapBehavior: UISnapBehavior?
    
    public init(circles: [DescritiveCircle]) {
        self.circles = circles
        super.init(frame: CGRect(x:0, y:0, width:sceneWidth, height:sceneHeight))
        self.animator = UIDynamicAnimator(referenceView: self)
        self.snapBehavior = nil
        self.backgroundColor = .white
        
       
        
        for circle in circles {
            self.addSubview(circle)
            let myPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(myPanAction))
            
            myPanGestureRecognizer.minimumNumberOfTouches = 1
            myPanGestureRecognizer.maximumNumberOfTouches = 1
            circle.addGestureRecognizer(myPanGestureRecognizer)
        }
        //layoutCircles()
    }
    
   /* private func layoutCircles() {
        for circle in circles {
        }
    } */
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func myPanAction(recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self)
        if let myView = recognizer.view {
            myView.center = CGPoint(x: myView.center.x + translation.x, y: myView.center.y + translation.y)
        }
        recognizer.setTranslation(.zero, in: self)
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
    }
    
    }
