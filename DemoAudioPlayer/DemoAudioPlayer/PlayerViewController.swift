//
//  PlayerViewController.swift
//  DemoAudioPlayer
//
//  Created by MAC on 6/23/22.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var trackingSlider: UISlider!
    @IBOutlet weak var buttonPlay: UIButton!
    
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var durationTimeLabel: UILabel!
    var audioPlayer: AVAudioPlayer?
    var timer: Timer?
    var rotate:Float = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        thumbnailImageView.circle()
        view.backgroundColor = .red
    }

    func playAudio (){
        do {
            //xin quyen phat loa ngoai
            //try: thu 1 hanh dong nao do ko chac chan thanh cong
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            // Lấy ra đường dẫn path đến file nhạc đã thêm vào dự án
            let path = Bundle.main.path(forResource: "audio.mp3", ofType:nil)!
            
            //lay ra url tu duong dan tren
            let urlAudio = URL(fileURLWithPath: path)
            print("URL Audio: ", urlAudio)
            
            // Khởi tạo trình phát nhạc
            audioPlayer = try AVAudioPlayer(contentsOf: urlAudio)
            audioPlayer?.delegate = self
            
            // Cho phép chỉnh tốc độ
            audioPlayer?.enableRate = true //mac dinh la flase
            
            //volum
            audioPlayer?.volume = 1 //0.0 -> 1
            
            //chuan bi phat nhac
            audioPlayer?.prepareToPlay()
            setupSlider()
            setupTimer()
            // Phát nhạc
            audioPlayer?.play()
            
        }
        catch { // neu hanh dong khong thanh cong thi se nhay xuong catch
            print(error.localizedDescription)
            
        }
    }
    
    func setupSlider (){
        trackingSlider.minimumValue = 0
        trackingSlider.maximumValue = Float (audioPlayer?.duration ?? 0)
        
        durationTimeLabel.text = Int(audioPlayer?.duration ?? 0).asString()
        
        trackingSlider.value = 0
    }
    
    func setupTimer (){
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { (_) in
            
            self.rotate += 1
            //rotateImage
            self.thumbnailImageView.transform = CGAffineTransform (rotationAngle: CGFloat( -.pi/360 * self.rotate))
            
            //update value of slider
            self.trackingSlider.value = Float(self.audioPlayer?.currentTime ?? 0) //currentime: thoi diem dang phat
            
            self.currentTimeLabel.text = Int(self.audioPlayer?.currentTime ?? 0).asString()
        })
    }
    
    func reloadState(){
        timer?.invalidate()
        rotate = 0 
        audioPlayer = nil
        thumbnailImageView.transform = CGAffineTransform(rotationAngle: 0)
        trackingSlider.value = 0
        buttonPlay.setImage(UIImage(systemName: "play.circle.fill"), for: .normal)
    }
    @IBAction func actionChangeSlider(_ sender: UISlider) {
        if let audioPlayer = audioPlayer {
            audioPlayer.currentTime = TimeInterval(sender.value)
        }
    }
    
   
    @IBAction func actionHalf(_ sender: UIButton) {
        audioPlayer?.rate = 0.5
    }
    
    @IBAction func actionOriginal(_ sender: UIButton) {
        audioPlayer?.rate = 1
    }
    
    @IBAction func actionDouble(_ sender: UIButton) {
        audioPlayer?.rate = 2
    }
    
    @IBAction func actionPlay(_ sender: UIButton) {
        // kiem tra xem trinh phat co ton tai ko
        if let audioPlayer = audioPlayer {
            //trinh phat nhac co dang phat hay ko
            if audioPlayer.isPlaying {
                audioPlayer.pause()
                timer?.invalidate()
                buttonPlay.setImage(UIImage(systemName: "play.circle.fill"), for: .normal)
            } else {
                audioPlayer.play() // tiep tuc phat
                setupTimer()
                buttonPlay.setImage(UIImage(systemName: "pause.circle.fill"), for: .normal)
            }
        }
        else {
            playAudio()
        }
    }
}

extension PlayerViewController:AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print("audio did finish")
        timer?.invalidate()
        reloadState()
//        showAlert(title: <#T##String#>, message: <#T##String#>, titleLeft: <#T##String#>, leftAction: <#T##(() -> Void)##(() -> Void)##() -> Void#>, rightTitle: <#T##String#>, rightAction: <#T##(() -> Void)##(() -> Void)##() -> Void#>)
    }
}
