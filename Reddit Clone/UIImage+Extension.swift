//
//  UIImage+Extension.swift
//  Reddit Clone
//
//  Created by Moin Uddin on 11/1/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import UIKit

//extension UIImage {
//    func imageWithBorder(width: CGFloat, color: UIColor) -> UIImage? {
//        let square = CGSize(width: min(size.width, size.height) + width * 2, height: min(size.width, size.height) + width * 2)
//        let imageView = UIImageView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: square))
//        imageView.contentMode = .center
//        imageView.image = self
//        imageView.layer.borderWidth = width
//        imageView.layer.borderColor = color.cgColor
//        UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, scale)
//        guard let context = UIGraphicsGetCurrentContext() else { return nil }
//        imageView.layer.render(in: context)
//        let result = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        return result
//    }
//}
