//
//  Utils.swift
//  watchCameraSample
//
//  Created by Yuta Akizuki on 2015/05/30.
//  Copyright (c) 2015年 ytakzk. All rights reserved.
//

import UIKit

class Utils: NSObject {
    // 画像幅を指定すると、アスペクト比を保ったままリサイズする
    func resizeImageWithWidth(width: CGFloat, image: UIImage) -> UIImage {
        let size = image.size
        let scale = width/size.width
        let resizedSize = CGSize(width: width, height: size.height*scale)
        UIGraphicsBeginImageContext(resizedSize)
        image.drawInRect(CGRectMake(0, 0, resizedSize.width, resizedSize.height))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizedImage
    }
}
