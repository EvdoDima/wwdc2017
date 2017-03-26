import Foundation
import UIKit


public class IntersectionView: UIView {
    public var intersectionPath: UIBezierPath
    
    
    public init(path: UIBezierPath, rect:CGRect) {
        self.intersectionPath = path
        super.init(frame: rect)
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func draw(_ rect: CGRect) {
        let fillColor = UIColor.white
        fillColor.setFill()
        
        // stroke
        intersectionPath.lineWidth = 1.0
        let strokeColor = UIColor.blue
        strokeColor.setStroke()
        
        // Move the path to a new location
        
        // fill and stroke the path (always do these last)
        intersectionPath.fill()
        intersectionPath.stroke()
    }
}
