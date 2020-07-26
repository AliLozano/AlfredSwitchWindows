//
//  Utils.swift
//  EnumWindows
//
//  Created by Ali Lozano on 7/23/20.
//  Copyright © 2020 Igor Mandrigin. All rights reserved.
//

import Foundation


/*
 For major Catalina Version a Recording Permission is required.
 */
func requestOSXPermissions() {
    guard let firstWindow = Windows.any else {
        return
    }

    guard !firstWindow.hasName else {
        return
    }

    let windowImage = CGWindowListCreateImage(.null, .optionIncludingWindow,
                                              firstWindow.number,
                                              [.boundsIgnoreFraming, .bestResolution])
    if windowImage == nil {
        debugPrint("Before using this app, you need to give permission in System Preferences > Security & Privacy > Privacy > Screen Recording.\nPlease authorize and re-launch.")
        exit(1)
    }
}
