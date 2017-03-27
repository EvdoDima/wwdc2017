import Foundation
import UIKit

let circleRadius: CGFloat = 120



public class DescritiveCircle: UIView {
    public var name : String
    public var descriptionText: String
    public var intersectVIew: UIView?
    
    public init(name: String, descriptionText:String, color: UIColor) {
        self.name = name
        self.descriptionText = descriptionText
        super.init(frame: CGRect(x:0,y:0,width:circleRadius*2,height:circleRadius*2))
        self.layer.cornerRadius = circleRadius
        
        let circleNameLabel: UILabel =
            UILabel(frame: CGRect(x:0, y:0,width: 0,height:0))
        circleNameLabel.text = self.name
        circleNameLabel.textAlignment = .center
        circleNameLabel.sizeToFit()

        self.addSubview(circleNameLabel)
            circleNameLabel.center = center
        self.backgroundColor = color
        self.clipsToBounds = false
        self.isUserInteractionEnabled = true
        
        self.layer.borderWidth = 2.0
        self.layer.borderColor = UIColor.darkGray.cgColor
    }
    
    

    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

