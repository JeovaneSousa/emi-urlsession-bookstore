//
//  AspectFillInFrame+UIImageView.swift
//  LearningTask-11.3
//
//  Created by rafael.rollo on 03/08/2022.
//

import UIKit

extension UIImage {
    
    /**
     Convenience initializer that supports scaling some images to match a frame width. Combined with top, center, bottom or the like Image View's content mode can help to present images preserving the aspect and clipping the appropriate portion.
     */
    convenience init?(_ imageName: String, aspectFillIn frame: CGRect) {
        guard let image = UIImage(named: imageName),
              let cgImage = image.cgImage else {
            return nil
        }
        
        let scale = image.size.width / frame.size.width
        self.init(cgImage: cgImage, scale: scale, orientation: .up)
    }
    
}

