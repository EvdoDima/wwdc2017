import Foundation
import UIKit


public class IntersectionView: UIView {
    public var intersectionPath1: UIBezierPath
    public var intersectionPath2: UIBezierPath

    
    
    public init(path1: UIBezierPath,path2: UIBezierPath, rect:CGRect) {
        self.intersectionPath1 = path1
        self.intersectionPath2 = path2
        super.init(frame: rect)
        self.backgroundColor = .clear
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func draw(_ rect: CGRect) {
        let fillColor = UIColor.brown
        // stroke
        intersectionPath1.lineWidth = 1.0
        intersectionPath2.lineWidth = 1.0
        
        intersectionPath1.addClip()
        intersectionPath2.addClip()
        fillColor.setFill()
    }
}
