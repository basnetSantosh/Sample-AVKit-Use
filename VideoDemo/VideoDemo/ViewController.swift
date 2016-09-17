//
//  ViewController.swift
//  VideoDemo
//
//  Created by Tensab San on 9/14/16.
//  Copyright © 2016 Tensab San. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func localButton(sender: AnyObject) {
        playVideo("local")
    }


    @IBAction func internetButton(sender: AnyObject) {
        playVideo("internet")
    }
    
    func playVideo(type:String) -> () {
        
        let filePath = NSBundle.mainBundle().pathForResource("trial", ofType: "mp4")
        print(filePath)
        let localVideoURL = NSURL(fileURLWithPath: filePath!)
        let internetVideoURL = NSURL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
        
        let player = (type == "local") ? AVPlayer(URL: localVideoURL) : AVPlayer(URL: internetVideoURL!)
        //let player = AVPlayer(URL: internetVideoURL!)
        let playerController = AVPlayerViewController()

        playerController.player = player
        playerController.showsPlaybackControls = true
        playerController.shouldAutorotate()
        
        self.presentViewController(playerController, animated: true) { 
            playerController.player!.play()

        }
        
    }
}

