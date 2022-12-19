//
//  TitleViewController.swift
//  Motion ball
//
//  Created by  aleksandr on 18.12.22.
//

import UIKit
import Lottie

class TitleViewController: UIViewController {
    
    @IBOutlet weak var playView: AnimationView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let animetePlayView = AnimationView(name: "play")
        animetePlayView.contentMode = .scaleAspectFit
        animetePlayView.frame = self.playView.bounds
        animetePlayView.loopMode = .loop
        animetePlayView.play()

        self.playView.addSubview(animetePlayView)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(playGaame)))
    }
   
    @objc func playGaame() {
        let storuboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storuboard.instantiateViewController(withIdentifier: "GameViewController")
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true)
    }
    
   
}
