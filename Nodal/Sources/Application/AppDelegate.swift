//
//  AppDelegate.swift
//  Nodal
//
//  Created by Павел Заварин on 31.12.2023.
//

import UIKit
import os

let logger = Logger()

@main
class AppDelegate: UIResponder { }

extension AppDelegate: UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

        logger.trace("❖❖ FinishLaunching AbsoluteTime: \(CFAbsoluteTimeGetCurrent())")
        logger.trace("❖❖ ApplicationVersion: \(Environment.applicationVersion)")
        logger.trace("❖❖ EnvironmentType: \(Environment.type)")
        return true
    }
}
