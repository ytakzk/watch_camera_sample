//
//  InterfaceController.swift
//  watchCameraSample WatchKit Extension
//
//  Created by Yuta Akizuki on 2015/05/30.
//  Copyright (c) 2015年 ytakzk. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var firstGroup: WKInterfaceGroup!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let ud   = NSUserDefaults(suiteName: APP_GROUP)
        
        if let data = ud?.dataForKey(KEY_PHOTO) {
            firstGroup.setBackgroundImage(UIImage(data: data)!)
        }
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
