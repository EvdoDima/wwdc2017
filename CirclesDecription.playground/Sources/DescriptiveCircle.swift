import Foundation
import UIKit

let circleRadius: CGFloat = 150



public class DescritiveCircle: UIView {
    public var name : String
    public var descriptionText: String
    
    public init(name: String, descriptionText:String, color: UIColor) {
        self.name = name
        self.descriptionText = descriptionText
        super.init(frame: CGRect(x:0,y:0,width:circleRadius,height:circleRadius))
        self.layer.cornerRadius = circleRadius/2
        self.backgroundColor = color
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

