//
//  GameViewController.swift
//  Motion ball
//
//  Created by  aleksandr on 17.12.22.
//

import UIKit
import CoreMotion
import Lottie

class GameViewController: UIViewController {
    
    var image = UIImage(named: "food")
    lazy var imageView = UIImageView(image: image)
    private lazy var imageViewSecond = UIImageView(image: image)
    private lazy var imageViewThird = UIImageView(image: image)
    var isGaming = true
    
    @IBOutlet weak var birdView: UIView!
    
    @IBOutlet weak var foodView: UIView!
    
    @IBOutlet weak var animeView: UIView!
    
    @IBOutlet weak var fonAnimeView: UIView!
    
    let myView = UIView()
    
    let motionManager = CMMotionManager()
    var timer: Timer!
    var absoluteVal = 0.0
    
    var lastX = 0.0
    var lastY = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(foodView)
        foodView.frame = CGRect(x: 900, y: 50, width: 70, height: 70)
        
        view.addSubview(birdView)
        birdView.frame = CGRect(x: 900, y: 200, width: 100, height: 100)
        
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 900, y: 50, width: 50, height: 50)
        view.addSubview(imageViewSecond)
        imageViewSecond.frame = CGRect(x: 900, y: 150, width: 50, height: 50)
        view.addSubview(imageViewThird)
        imageViewThird.frame = CGRect(x: 900, y: 300, width: 50, height: 50)
        
        motionManager.startAccelerometerUpdates()
        motionManager.startGyroUpdates()
        motionManager.startMagnetometerUpdates()
        motionManager.startDeviceMotionUpdates()
        
        timer = Timer.scheduledTimer(timeInterval: 0.0083333333, target: self, selector: #selector(GameViewController.update), userInfo: nil, repeats: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let animeteBirdView = AnimationView(name: "bird3")
        animeteBirdView.contentMode = .scaleAspectFill
        animeteBirdView.frame = self.birdView.bounds
        animeteBirdView.loopMode = .loop
        animeteBirdView.play()
        self.birdView.addSubview(animeteBirdView)
        
        let animeteFlyView = AnimationView(name: "bird2")
        animeteFlyView.contentMode = .scaleAspectFill
        animeteFlyView.frame = self.foodView.bounds
        animeteFlyView.loopMode = .loop
        animeteFlyView.play()
        self.foodView.addSubview(animeteFlyView)
        
        let animeteSkyView = AnimationView(name: "sky")
        animeteSkyView.contentMode = .scaleAspectFill
        animeteSkyView.frame = self.fonAnimeView.bounds
        animeteSkyView.loopMode = .loop
        animeteSkyView.play()
        self.fonAnimeView.addSubview(animeteSkyView)
        
        let animetionBird0View = AnimationView(name: "bird0")
        animetionBird0View.contentMode = .scaleAspectFit
        animetionBird0View.frame = self.animeView.bounds
        animetionBird0View.loopMode = .loop
        animetionBird0View.play()
        self.animeView.addSubview(animetionBird0View)
        
        
        UIView.animate(withDuration: 8, delay: 4, options: [
            .curveLinear, .repeat], animations: {
                self.foodView.frame.origin.x +=
                self.view.frame.height - 1800
            })
        
        UIView.animate(withDuration: 4, delay: 4, options: [
            .curveLinear, .repeat], animations: {
                self.birdView.frame.origin.x +=
                self.view.frame.height - 1600
            })
        
        UIView.animate(withDuration: 4, delay: 4, options: [
            .curveLinear, .repeat], animations: {
                self.imageView.frame.origin.x +=
                self.view.frame.height - 1900
            })
        
        UIView.animate(withDuration: 3, delay: 5, options: [
            .curveLinear, .repeat], animations: {
                self.imageViewSecond.frame.origin.x +=
                self.view.frame.height - 1600
            })
        
        UIView.animate(withDuration: 8, delay: 2, options: [
            .curveLinear, .repeat], animations: {
                self.imageViewThird.frame.origin.x +=
                self.view.frame.height - 1900
            })
        intersectsFirstBird()
        intersectsSecondBird()
        intersectsThirdBird()
    }
    
    func intersectsFirstBird() {
        guard isGaming else { return }
        if checkIntersect(animeView, imageView){
            print("bird")
            isGaming = true
            
            imageView.frame = CGRect(x: 900, y: 50, width: 50, height: 50)
            UIView.animate(withDuration: 6, delay: 4, options: [
                .curveLinear, .repeat], animations: {
                    self.imageView.frame.origin.x +=
                    self.view.frame.height - 1400
                })
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.intersectsFirstBird()
        }
    }
    
    func intersectsSecondBird() {
        guard isGaming else { return }
        if checkIntersect(animeView, imageViewSecond){
            print("bird")
            isGaming = true
            imageViewSecond.frame = CGRect(x: 900, y: 150, width: 50, height: 50)
            UIView.animate(withDuration: 3, delay: 5, options: [
                .curveLinear, .repeat], animations: {
                    self.imageViewSecond.frame.origin.x +=
                    self.view.frame.height - 1500
                })
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.intersectsSecondBird()
        }
    }
    
    func intersectsThirdBird() {
        guard isGaming else { return }
        if checkIntersect(animeView, imageViewThird){
            print("bird")
            isGaming = true
            imageViewThird.frame = CGRect(x: 900, y: 300, width: 50, height: 50)
            UIView.animate(withDuration: 8, delay: 2, options: [
                .curveLinear, .repeat], animations: {
                    self.imageViewThird.frame.origin.y +=
                    self.view.frame.width - 1300
                })
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.intersectsThirdBird()
        }
    }
  
    func checkIntersect(_ first: UIView, _ second: UIView) -> Bool {
        guard let firstFrame = first.layer.presentation()?.frame,
              let secondFrame = second.layer.presentation()?.frame else { return true }
        
        return firstFrame.intersects(secondFrame)
    }
    
    @objc func update() {
        if let accelerometerData = motionManager.accelerometerData {
            let valX = accelerometerData.acceleration.x
            let valY = accelerometerData.acceleration.y
            
            animeView.frame.origin.x -= CGFloat(valY * 5)
            animeView.frame.origin.y -= CGFloat(valX * 5)
            
            lastX = valY
            lastY = valX
        }
    }
}
