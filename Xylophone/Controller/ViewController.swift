//
//  ViewController.swift
//  Xylophone
//
//  Created by Abzal on 25.10.2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonA(_ sender: UIButton) {
    play(fileName: sender.title(for: .normal)!)

    sender.alpha = 0.5
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
    sender.alpha = 1.0
      }
    }
    
    func play(fileName:String) {
    guard let path = Bundle.main.path(forResource: fileName, ofType:"wav") else {
        return }
    let url = URL(fileURLWithPath: path)

    do {
        player = try AVAudioPlayer(contentsOf: url)
        player?.play()
        
    } catch let error {
        print(error.localizedDescription)
    }
}
    
}

