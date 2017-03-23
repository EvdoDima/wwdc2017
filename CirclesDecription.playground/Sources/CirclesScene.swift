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
        }
        layoutCircles()
    }
    
    private func layoutCircles() {
        for circle in circles {
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let touchLocation = touch.location(in: superview)
            for circle in circles {
                if (circle.frame.contains(touchLocation)) {
                    snapBehavior = UISnapBehavior(item: circle, snapTo: touchLocation)
                    animator?.addBehavior(snapBehavior!)
                }
            }
        }
    }
    
    override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let touchLocation = touch.location(in: superview)
            if let snapBehavior = snapBehavior {
                snapBehavior.snapPoint = touchLocation
            }
        }
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let snapBehavior = snapBehavior {
            animator?.removeBehavior(snapBehavior)
        }
        snapBehavior = nil
    }


    
    
    
}
