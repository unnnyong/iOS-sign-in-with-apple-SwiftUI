//
//  DarkModeManager.swift
//  WWDC2019
//
//  Created by Eunyeong Kim on 2019/07/06.
//  Copyright © 2019 Eunyeong Kim. All rights reserved.
//

import UIKit

struct DarkModeManager {
    static let isDarkMode = UITraitCollection().userInterfaceStyle == .dark ? true : false
}
