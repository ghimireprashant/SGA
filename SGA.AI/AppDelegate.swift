//
//  AppDelegate.swift
//  SGA.AI
//
//  Created by Prashant Ghimire on 2023-02-20.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
        var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        IQKeyboardManager.shared.enable = true // enable keyboard manager
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.setUpInitialViewController()
        return true
    }
    /// This Function is for setting up initial viewController
    private func setUpInitialViewController() {
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        self.window?.rootViewController = viewController
        self.window?.makeKeyAndVisible()
    }
    // MARK: - change root animation
     func changeRootViewController(with desiredViewController: UIViewController) {
       let snapshot: UIView = (window?.snapshotView(afterScreenUpdates: true))!
       desiredViewController.view.addSubview(snapshot)
       window?.rootViewController = desiredViewController
       window?.makeKeyAndVisible()
       UIView.animate(withDuration: 0.3, animations: {() in
         snapshot.layer.opacity = 0
         snapshot.layer.transform = CATransform3DMakeScale(1.5, 1.5, 1.5)
       }, completion: { (_: Bool) in
         snapshot.removeFromSuperview()
       })
     }
   }
extension AppDelegate {
    // MARK: - appdelegate insatance
    class func shared() -> AppDelegate? {
        return UIApplication.shared.delegate as? AppDelegate
    }
}
