//
//  StartViewController.swift
//  sf_homework_module_21_balls
//
//  Created by Ruslan Ismailov on 19/07/22.
//

import UIKit

class StartViewController: UIViewController {
    
    let nameView = "ViewController"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func actionButtonStart(_ sender: UIButton) {
        
        guard let viewScreen = storyboard?.instantiateViewController(withIdentifier: nameView) as? ViewController else {return}
        viewScreen.modalTransitionStyle = .coverVertical
        viewScreen.modalPresentationStyle = .overCurrentContext
        present(viewScreen, animated: true, completion: nil)
        
    }
    
    

}
