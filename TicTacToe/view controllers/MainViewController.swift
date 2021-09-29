//
//  ViewController.swift
//  TicTacToe
//
//  Created by Aiden Meeker on 9/29/21.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func playPressed(_ sender: Any) {
        let playingVC = storyboard?.instantiateViewController(withIdentifier: "PlayingVC") as? PlayingViewController
        print("moving to playing view")
        view.window?.rootViewController = playingVC
        view.window?.makeKeyAndVisible()
    }
    

}

