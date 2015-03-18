//
//  InterfaceController.swift
//  RedVsBlueWatchKitApp WatchKit Extension
//
//  Created by Jonas Baer on 17.03.15.
//  Copyright (c) 2015 jonas-baer.com. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var viewCurrentTempText: WKInterfaceLabel!
    @IBOutlet weak var sliderForColorAdj: WKInterfaceSlider!
    @IBOutlet weak var colorChangingSwitch: WKInterfaceSwitch!
    @IBOutlet weak var resetButton: WKInterfaceButton!

    @IBOutlet weak var groupForBackgroundColor: WKInterfaceGroup!

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)

        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        self.setupBlue() // self.xyz is used for functions which are defined in the specific class...
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func changedSlider(value: Float) {
        // A floating-point number in the range 0.0 to 1.0, where 0.0 represents totally transparent and 1.0 represents totally opaque.
//        println("value: \(value)")
        switch value {
        case 0:
            groupForBackgroundColor.setAlpha(0.15)
        case 1:
            groupForBackgroundColor.setAlpha(0.2)
        case 2:
            groupForBackgroundColor.setAlpha(0.4)
        case 3:
            groupForBackgroundColor.setAlpha(0.6)
        case 4:
            groupForBackgroundColor.setAlpha(0.8)
        case 5:
            groupForBackgroundColor.setAlpha(1.0)
        default:
            //groupForBackgroundColor.setAlpha(1.0)
            println("default?")
        }
    }

    @IBAction func changedBlueRedSetting(value: Bool) {
//        if value == true {
//            groupForBackgroundColor.setBackgroundColor(UIColor.blueColor())
//            viewCurrentTempText.setText("Cool")
//        }
//        else if value == false {
//            groupForBackgroundColor.setBackgroundColor(UIColor.redColor())
//            viewCurrentTempText.setText("Hot")
//        }
        if value == true {
            self.setupBlue()
        }
        else if value == false {
            self.setupRed()
        }
    }

    @IBAction func resetButtonPressed() {
//        self.sliderForColorAdj.setValue(5) // bug of SWIFT ??? - only works the first time?
//        self.changedSlider(1.0)
//
//        self.viewCurrentTempText.setText("Cool")
//
//        self.colorChangingSwitch.setOn(true)
//
//        self.groupForBackgroundColor.setBackgroundColor(UIColor.blueColor())
//        self.groupForBackgroundColor.setAlpha(1.0)
        self.setupBlue()
    }

    // helper functions (set default settings for color blue / red
    func setupBlue () {
        let deepSkyBlue = UIColor(red: 0.0, green: 191.0, blue: 255.0, alpha: 1.0)
        self.groupForBackgroundColor.setBackgroundColor(deepSkyBlue)
        self.groupForBackgroundColor.setCornerRadius(0.0)

        self.colorChangingSwitch.setOn(true)

        self.sliderForColorAdj.setValue(1.0)

        self.viewCurrentTempText.setText("Cool")
    }

    func setupRed () {
        let fireBrickRed = UIColor(red: 153.0, green: 0.0, blue: 0.0, alpha: 1.0)
        self.groupForBackgroundColor.setBackgroundColor(fireBrickRed)
        self.groupForBackgroundColor.setCornerRadius(0.0)

        self.colorChangingSwitch.setOn(false)

        self.sliderForColorAdj.setValue(1.0)

        self.viewCurrentTempText.setText("Hot")
    }

}
