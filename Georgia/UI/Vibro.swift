//
//  Vibro.swift
//  Georgia
//
//  Created by Худышка К on 09.05.2023.
//

import Foundation
import AudioToolbox

class Vibro: NSObject {
    static func strong() {
        AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
    }

    static func weak() {
        AudioServicesPlaySystemSound(1_520)
    }
}
