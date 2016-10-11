//
//  ViewController.swift
//  HelloPlayVedio
//
//  Created by 洪德晟 on 2016/10/7.
//  Copyright © 2016年 洪德晟. All rights reserved.
//

import UIKit

// 1. 匯入函式庫
import AVFoundation
import AVKit

class ViewController: UIViewController {
    
    // 4-1. 產生AVPlayer
    var videoPlayer: AVPlayer?
    
    // 2. 產生按鈕
    @IBAction func playVedio(_ sender: UIButton) {
        
        // 3. 找到路徑 & URL
        //        let path = Bundle.main.path(forResource: "HipHop", ofType: "mp4")
        //
        //        URL(fileURLWithPath: "path")    ...舊方法
        
        if let url = Bundle.main.url(forResource: "HipHop", withExtension: "mp4") {
            
            // 4. 產生AVPlayer, AVPlayerViewController
            videoPlayer = AVPlayer(url: url)
            let videoPlayerController = AVPlayerViewController()
            
            // 5. 設定AVPlayerViewController的屬性
            videoPlayerController.player = videoPlayer
            
            // 5. 顯示並播放
            present(videoPlayerController, animated: true, completion: nil)
            videoPlayer?.play()
            
            // 7. 加入監聽通知的程式碼
            NotificationCenter.default.addObserver(self, selector: #selector(ViewController.playDidReachEnd(noti:)), name: Notification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
            
        }
    }
    
    // 6. 收到通知後要做的事
    func playDidReachEnd(noti: Notification) {
        
        // 8. 把短片的時間調到零
        videoPlayer?.currentItem?.seek(to: kCMTimeZero)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

