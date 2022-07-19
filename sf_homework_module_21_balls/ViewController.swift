//
//  ViewController.swift
//  sf_homework_module_21_balls
//
//  Created by Ruslan Ismailov on 16/07/22.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var ball_1: CustomBall!
    
    @IBOutlet weak var ball_2: CustomBall!
    
    @IBOutlet weak var ball_3: CustomBall!
    
    @IBOutlet weak var ball_4: CustomBall!
    
    @IBOutlet weak var ball_5: CustomBall!
    
    @IBOutlet weak var ball_6: CustomBall!
    
    @IBOutlet weak var ball_7: CustomBall!
    
    
    //Переменные для записи начальных позиций на экране
    var positionBall_1_x: CGFloat!
    var positionBall_1_y: CGFloat!
    
    var positionBall_2_x: CGFloat!
    var positionBall_2_y: CGFloat!
    
    var positionBall_3_x: CGFloat!
    var positionBall_3_y: CGFloat!
    
    var positionBall_4_x: CGFloat!
    var positionBall_4_y: CGFloat!
    
    var positionBall_5_x: CGFloat!
    var positionBall_5_y: CGFloat!
    
    var positionBall_6_x: CGFloat!
    var positionBall_6_y: CGFloat!
    
    var positionBall_7_x: CGFloat!
    var positionBall_7_y: CGFloat!
    
    
    @IBOutlet weak var restartButton: UIButton!
    
    
    var allHidden: Bool = false
    
    let gesture = UIGestureRecognizer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        restartButton.isHidden = true
        
        gesture.delegate = self
        
        positionBall_1_x = ball_1.frame.origin.x
        positionBall_1_y = ball_1.frame.origin.y
        
        positionBall_2_x = ball_2.frame.origin.x
        positionBall_2_y = ball_2.frame.origin.y
        
        positionBall_3_x = ball_3.frame.origin.x
        positionBall_3_y = ball_3.frame.origin.y
        
        positionBall_4_x = ball_4.frame.origin.x
        positionBall_4_y = ball_4.frame.origin.y
        
        positionBall_5_x = ball_5.frame.origin.x
        positionBall_5_y = ball_5.frame.origin.y
        
        positionBall_6_x = ball_6.frame.origin.x
        positionBall_6_y = ball_6.frame.origin.y
        
        positionBall_7_x = ball_7.frame.origin.x
        positionBall_7_y = ball_7.frame.origin.y
        
        
        
    }
    
    
    @IBAction func pressToStart(_ sender: Any) {
        
        if allHidden {
            reset(ball: ball_1, x: positionBall_1_x, y: positionBall_1_y)
            reset(ball: ball_2, x: positionBall_2_x, y: positionBall_2_y)
            reset(ball: ball_3, x: positionBall_3_x, y: positionBall_3_y)
            reset(ball: ball_4, x: positionBall_4_x, y: positionBall_4_y)
            reset(ball: ball_5, x: positionBall_5_x, y: positionBall_5_y)
            reset(ball: ball_6, x: positionBall_6_x, y: positionBall_6_y)
            reset(ball: ball_7, x: positionBall_7_x, y: positionBall_7_y)
            
            restartButton.isHidden = true
        }
    }
    
    func reset(ball: CustomBall, x: CGFloat, y: CGFloat){
        ball.isHidden = false
        ball.workingView.backgroundColor = .blue
        ball.frame.origin.x = x
        ball.frame.origin.y = y
        ball.workingView.frame.size = CGSize(width: 50, height: 50)
        ball.workingView.layer.cornerRadius = ball.workingView.frame.size.height / 2
    }
    
    func catchBall(catchBall: CustomBall, currentBall: CustomBall){
        var x: Bool = false
        var y: Bool = false
        
        for value in Int(catchBall.frame.minX)...Int(catchBall.frame.maxX){
            if (Int(currentBall.frame.origin.x) == value) || (Int(currentBall.frame.minX) == value) || (Int(currentBall.frame.maxX) == value){
                x = true
            }
        }

        for value in Int(catchBall.frame.minY)...Int(catchBall.frame.maxY){
            if (Int(currentBall.frame.origin.y) == value) || (Int(currentBall.frame.minY) == value) || (Int(currentBall.frame.maxY) == value){
                y = true
            }
        }
        if x && y {
            catchBall.workingView.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 180/255, alpha: 1.0)
            catchBall.workingView.frame = CGRect(
                x: catchBall.workingView.frame.origin.x ,
                y: catchBall.workingView.frame.origin.y ,
                width: catchBall.workingView.frame.width + 10,
                height: catchBall.workingView.frame.height + 10)
            catchBall.workingView.layer.cornerRadius = catchBall.workingView.frame.size.height / 2
            currentBall.isHidden = true
        }
        
        if ball_2.isHidden && ball_3.isHidden && ball_4.isHidden && ball_5.isHidden && ball_6.isHidden && ball_7.isHidden{
            allHidden = true
            restartButton.isHidden = false
        }
    }

    @IBAction func _customBall(_ sender: UIPanGestureRecognizer) {
        
        
        
        let gestureTranslation = sender.translation(in: view)
        guard let gestureView = sender.view else {return}
        
        gestureView.center = CGPoint(
            x: gestureView.center.x + gestureTranslation.x,
            y: gestureView.center.y + gestureTranslation.y)
        
        sender.setTranslation(.zero, in: view)
        guard sender.state == .ended else {return}
        
        catchBall(catchBall: ball_2, currentBall: ball_1)
        catchBall(catchBall: ball_3, currentBall: ball_1)
        catchBall(catchBall: ball_4, currentBall: ball_1)
        catchBall(catchBall: ball_5, currentBall: ball_1)
        catchBall(catchBall: ball_6, currentBall: ball_1)
        catchBall(catchBall: ball_7, currentBall: ball_1)
        
        if ball_2.isHidden && ball_3.isHidden && ball_4.isHidden && ball_5.isHidden && ball_6.isHidden && ball_7.isHidden{
            allHidden = true
            restartButton.isHidden = false
        }

    }
        
    @IBAction func customBall_2(_ sender: UIPanGestureRecognizer) {
        
        let gestureTranslation = sender.translation(in: view)
        guard let gestureView = sender.view else {return}
        
        gestureView.center = CGPoint(
            x: gestureView.center.x + gestureTranslation.x,
            y: gestureView.center.y + gestureTranslation.y)
        
        sender.setTranslation(.zero, in: view)
        guard sender.state == .ended else {return}
        
        catchBall(catchBall: ball_1, currentBall: ball_2)
        catchBall(catchBall: ball_3, currentBall: ball_2)
        catchBall(catchBall: ball_4, currentBall: ball_2)
        catchBall(catchBall: ball_5, currentBall: ball_2)
        catchBall(catchBall: ball_6, currentBall: ball_2)
        catchBall(catchBall: ball_7, currentBall: ball_2)
        
        if ball_1.isHidden && ball_3.isHidden && ball_4.isHidden && ball_5.isHidden && ball_6.isHidden && ball_7.isHidden{
            allHidden = true
            restartButton.isHidden = false
        }
    }
    @IBAction func panGestureCustomBall_3(_ sender: UIPanGestureRecognizer) {
        
        let gestureTranslation = sender.translation(in: view)
        guard let gestureView = sender.view else {return}
        
        gestureView.center = CGPoint(
            x: gestureView.center.x + gestureTranslation.x,
            y: gestureView.center.y + gestureTranslation.y)
        
        sender.setTranslation(.zero, in: view)
        guard sender.state == .ended else {return}
        
        catchBall(catchBall: ball_1, currentBall: ball_3)
        catchBall(catchBall: ball_2, currentBall: ball_3)
        catchBall(catchBall: ball_4, currentBall: ball_3)
        catchBall(catchBall: ball_5, currentBall: ball_3)
        catchBall(catchBall: ball_6, currentBall: ball_3)
        catchBall(catchBall: ball_7, currentBall: ball_3)
        
        if ball_1.isHidden && ball_2.isHidden && ball_4.isHidden && ball_5.isHidden && ball_6.isHidden && ball_7.isHidden{
            allHidden = true
            restartButton.isHidden = false
        }
    }
    @IBAction func panGestureCustomBall_4(_ sender: UIPanGestureRecognizer) {
        
        let gestureTranslation = sender.translation(in: view)
        guard let gestureView = sender.view else {return}
        
        gestureView.center = CGPoint(
            x: gestureView.center.x + gestureTranslation.x,
            y: gestureView.center.y + gestureTranslation.y)
        
        sender.setTranslation(.zero, in: view)
        guard sender.state == .ended else {return}
        
        catchBall(catchBall: ball_1, currentBall: ball_4)
        catchBall(catchBall: ball_2, currentBall: ball_4)
        catchBall(catchBall: ball_3, currentBall: ball_4)
        catchBall(catchBall: ball_5, currentBall: ball_4)
        catchBall(catchBall: ball_6, currentBall: ball_4)
        catchBall(catchBall: ball_7, currentBall: ball_4)
        
        if ball_1.isHidden && ball_2.isHidden && ball_3.isHidden && ball_5.isHidden && ball_6.isHidden && ball_7.isHidden{
            allHidden = true
            restartButton.isHidden = false
        }
    }
    @IBAction func panGestureCustomBall_5(_ sender: UIPanGestureRecognizer) {
        
        let gestureTranslation = sender.translation(in: view)
        guard let gestureView = sender.view else {return}
        
        gestureView.center = CGPoint(
            x: gestureView.center.x + gestureTranslation.x,
            y: gestureView.center.y + gestureTranslation.y)
        
        sender.setTranslation(.zero, in: view)
        guard sender.state == .ended else {return}
        
        catchBall(catchBall: ball_1, currentBall: ball_5)
        catchBall(catchBall: ball_2, currentBall: ball_5)
        catchBall(catchBall: ball_3, currentBall: ball_5)
        catchBall(catchBall: ball_4, currentBall: ball_5)
        catchBall(catchBall: ball_6, currentBall: ball_5)
        catchBall(catchBall: ball_7, currentBall: ball_5)
        
        if ball_1.isHidden && ball_2.isHidden && ball_3.isHidden && ball_4.isHidden && ball_6.isHidden && ball_7.isHidden{
            allHidden = true
            restartButton.isHidden = false
        }
    }
    @IBAction func panGestureCustomBall_6(_ sender: UIPanGestureRecognizer) {
        
        let gestureTranslation = sender.translation(in: view)
        guard let gestureView = sender.view else {return}
        
        gestureView.center = CGPoint(
            x: gestureView.center.x + gestureTranslation.x,
            y: gestureView.center.y + gestureTranslation.y)
        
        sender.setTranslation(.zero, in: view)
        guard sender.state == .ended else {return}
        
        catchBall(catchBall: ball_1, currentBall: ball_6)
        catchBall(catchBall: ball_2, currentBall: ball_6)
        catchBall(catchBall: ball_3, currentBall: ball_6)
        catchBall(catchBall: ball_4, currentBall: ball_6)
        catchBall(catchBall: ball_5, currentBall: ball_6)
        catchBall(catchBall: ball_7, currentBall: ball_6)
        
        if ball_1.isHidden && ball_2.isHidden && ball_3.isHidden && ball_4.isHidden && ball_5.isHidden && ball_7.isHidden{
            allHidden = true
            restartButton.isHidden = false
        }
    }
    @IBAction func panGestureCustomBall_7(_ sender: UIPanGestureRecognizer) {
        
        let gestureTranslation = sender.translation(in: view)
        guard let gestureView = sender.view else {return}
        
        gestureView.center = CGPoint(
            x: gestureView.center.x + gestureTranslation.x,
            y: gestureView.center.y + gestureTranslation.y)
        
        sender.setTranslation(.zero, in: view)
        guard sender.state == .ended else {return}
        
        catchBall(catchBall: ball_1, currentBall: ball_7)
        catchBall(catchBall: ball_2, currentBall: ball_7)
        catchBall(catchBall: ball_3, currentBall: ball_7)
        catchBall(catchBall: ball_4, currentBall: ball_7)
        catchBall(catchBall: ball_5, currentBall: ball_7)
        catchBall(catchBall: ball_6, currentBall: ball_7)
        
        if ball_1.isHidden && ball_2.isHidden && ball_3.isHidden && ball_4.isHidden && ball_5.isHidden && ball_6.isHidden{
            allHidden = true
            restartButton.isHidden = false
        }
    }
    
}

extension ViewController: UIGestureRecognizerDelegate{
    
}


