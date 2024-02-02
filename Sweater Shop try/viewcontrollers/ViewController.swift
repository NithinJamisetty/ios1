import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var user: UITextField!
    var backgroundMusicPlayer: AVAudioPlayer?
    var videoPlayer: AVPlayer?
    var isPlayingVideo = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pass.isSecureTextEntry = true
        
        if let songURL = Bundle.main.url(forResource: "nithin", withExtension: "mp3") {
            do {
                backgroundMusicPlayer = try AVAudioPlayer(contentsOf: songURL)
                backgroundMusicPlayer?.numberOfLoops = -1 // Loop indefinitely
                backgroundMusicPlayer?.prepareToPlay()
                backgroundMusicPlayer?.play()
            } catch {
                print("Error playing background music: \(error)")
            }
        } else {
            print("Background music file not found.")
        }
    }
    
    @IBAction func signin(_ sender: Any) {
        if user.text == "Nithin" && pass.text == "nithin1" {
            performSegue(withIdentifier: "login1", sender: nil)
            name1 = user.text!
        }
    }
    
    @IBAction func info(_ sender: Any) {
        if let path = Bundle.main.path(forResource: "home", ofType: "mp4") {
            let myurl = URL(fileURLWithPath: path)
            let playerViewController = AVPlayerViewController()
            videoPlayer = AVPlayer(url: myurl)
            playerViewController.player = videoPlayer
            present(playerViewController, animated: true) {
                self.isPlayingVideo = true
                self.backgroundMusicPlayer?.pause()
                self.addObserverForVideoPlayer()
                playerViewController.player?.play()
            }
        } else {
            print("Resource 'home.mp4' not found.")
        }
    }
    
    func addObserverForVideoPlayer() {
        videoPlayer?.addObserver(self, forKeyPath: "rate", options: [.new], context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "rate" {
            if let rate = change?[.newKey] as? Float {
                if rate == 0 {
                    isPlayingVideo = false
                    backgroundMusicPlayer?.play()
                }
            }
        }
    }
}
