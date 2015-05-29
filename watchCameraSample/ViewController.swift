//
//  ViewController.swift
//  watchCameraSample
//
//  Created by Yuta Akizuki on 2015/05/30.
//  Copyright (c) 2015年 ytakzk. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var skinImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // プレビューに画像を入れる
        let ud   = NSUserDefaults(suiteName: APP_GROUP)
        if let data = ud?.dataForKey(KEY_PHOTO) {
            skinImageView.image = UIImage(data: data)!
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // 写真を撮る
    @IBAction func takePhoto(sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
            let controller = UIImagePickerController()
            controller.delegate = self
            controller.allowsEditing = true
            controller.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            self.presentViewController(controller, animated: true, completion: nil)
        }
    }
    
    // 写真をが撮られた後
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            // TODO: 実機への転送速度をあげるために保存前にリサイズする
            //       リサイズの幅は追って検討する
            let resizedImage = Utils().resizeImageWithWidth(600.0, image: image)
            
            let ud   = NSUserDefaults(suiteName: APP_GROUP)
            let data = NSData(data: UIImageJPEGRepresentation(resizedImage, 0.8))
            ud?.setObject(data, forKey: KEY_PHOTO)
            
            picker.dismissViewControllerAnimated(true, completion: nil)

            // プレビューの画像差し替え
            skinImageView.image = resizedImage
            
            // アラートを出す
            var actionController = UIAlertController(title: "保存しました", message: "Apple Watchでアプリを再起動してください。", preferredStyle: .Alert)
            let action           = UIAlertAction(title: "OK", style: .Default) { (action) -> Void in }
            actionController.addAction(action)
            self.presentViewController(actionController, animated: true, completion: nil)
            
            return
        }
        picker.dismissViewControllerAnimated(true, completion: nil)
    }

}

