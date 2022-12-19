//
//  LoadingViewController.swift
//  Motion ball
//
//  Created by  aleksandr on 19.12.22.
//

import UIKit
import Lottie

class LoadingViewController: UIViewController {

    @IBOutlet weak var loadingView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let animeteLoadingView = AnimationView(name: "loading")
        animeteLoadingView.contentMode = .scaleAspectFit
        animeteLoadingView.frame = self.loadingView.bounds
        animeteLoadingView.loopMode = .loop
        animeteLoadingView.play()

        self.loadingView.addSubview(animeteLoadingView)
        Timer.scheduledTimer(timeInterval: 6, target: self, selector: #selector(loading), userInfo: nil, repeats: false)
    }
    
    @objc func loading() {
        let storuboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storuboard.instantiateViewController(withIdentifier: "TitleViewController")
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true)
    }
 

}
