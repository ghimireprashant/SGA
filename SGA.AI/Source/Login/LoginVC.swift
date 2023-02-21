//
//  LoginScrollViewController.swift
//  SGA.AI
//
//  Created by Prashant Ghimire on 2023-02-20.
//

import UIKit
//import TransitionButton

class LoginVC: UIViewController {
    
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var signInGoogleBtn: UIButton!
    @IBOutlet weak var secureTextBtn: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        setCornerRadius()
//        hideKeyboardWhenTappedAround()
    }



    override func viewDidAppear(_ animated: Bool) {
//        if #available(iOS 13, *) {
//            let statusBar = UIView(frame: (UIApplication.shared.keyWindow?.windowScene?.statusBarManager?.statusBarFrame)!)
//            statusBar.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.2274509804, blue: 0.1803921569, alpha: 1)
//            UIApplication.shared.keyWindow?.addSubview(statusBar)
//        }
    }
    
    func setCornerRadius() {
        self.signInBtn.round()
        self.signInGoogleBtn.round()
        self.loginView.layer.cornerRadius = 40.0
        self.loginView.setShadow()
        self.signInGoogleBtn.layer.borderColor = #colorLiteral(red: 0.1147934226, green: 0.2276530774, blue: 0.1814977513, alpha: 1)
        self.signInGoogleBtn.layer.borderWidth = 2.0
    }
    
    
    @IBAction func signInAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        let navigation = UINavigationController(rootViewController: viewController)
        AppDelegate.shared()?.changeRootViewController(with: navigation)
    }
    
    
    @IBAction func signInWithGoogleAction(_ sender: UIButton) {
    }
    
    
    @IBAction func gotoRegistrationAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "RegistrationVC") as! RegistrationVC
        present(vc, animated: true, completion: nil)
    }

    @IBAction func forgotPasswordAction(_ sender: Any) {
//        let vc = storyboard?.instantiateViewController(withIdentifier: "ForgotPasswordVC") as! ForgotPasswordVC
//        present(vc, animated: true, completion: nil)
    }


    @IBAction func secureTextAction(_ sender: UIButton) {
        if sender.isSelected {
            passwordTextField.isSecureTextEntry = true
            secureTextBtn.setImage(#imageLiteral(resourceName: "invisible"), for: .normal)
            sender.isSelected = false
        } else {
            passwordTextField.isSecureTextEntry = false
            secureTextBtn.setImage(#imageLiteral(resourceName: "visibility-button"), for: .normal)
            sender.isSelected = true
        }
    }
    
    
//    func spinButton() {
//        signInButton.startAnimation() // 2: Then start the animation when the user tap the button
//        let qualityOfServiceClass = DispatchQoS.QoSClass.background
//        let backgroundQueue = DispatchQueue.global(qos: qualityOfServiceClass)
//        backgroundQueue.async {
//            // Do your networking task or background work here.
//            DispatchQueue.main.asyncAfter(deadline: .now()+2) { [weak self] in
//                // 4: Stop the animation, here you have three options for the `animationStyle` property:
//                // .expand: useful when the task has been compeletd successfully and you want to expand the button and transit to another view controller in the completion callback
//                // .shake: when you want to reflect to the user that the task did not complete successfly
//                // .normal
//                guard let self = self else { return }
//                self.signInButton.stopAnimation(animationStyle: .expand) {
//                    guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "DashboardViewController") as? DashboardViewController else { return }
//                    self.present(vc, animated: true, completion: nil)
//                }
//            }
//        }
//    }
    
}

