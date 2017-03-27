import Foundation
import UIKit


public class TotalIntersectionlayer: CALayer {
    public var intersectionPath1: UIBezierPath
    public var intersectionPath2: UIBezierPath
    public var intersectionPath3: UIBezierPath

    
    public init(path1:CGPath,path2:CGPath,path3:CGPath) {
        self.intersectionPath1 = UIBezierPath(cgPath:path1)
        self.intersectionPath2 = UIBezierPath(cgPath:path2)
        self.intersectionPath3 = UIBezierPath(cgPath:path3)
        super.init()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func draw(in ctx: CGContext) {
        UIGraphicsPushContext(ctx)
            let fillColor = UIColor.brown
            intersectionPath1.addClip()
            intersectionPath2.addClip()
            intersectionPath3.addClip()
            fillColor.setFill()
        UIGraphicsPopContext()

    }
}

