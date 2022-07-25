//
//  CustomBall.swift
//  sf_homework_module_21_balls
//
//  Created by Ruslan Ismailov on 16/07/22.
//

import UIKit

class CustomBall: UIView {
    var workingView: UIView!
    var xibName: String = "CustomBall"
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setView()
    }
    
    func fromXib() -> UIView{
        let bundle = Bundle(for: type(of: self))
        let xib = UINib(nibName: xibName, bundle: bundle)
        
        let view = xib.instantiate(withOwner: xibName, options: nil).first as! UIView
        return view
    }
    
    func setView(){
        workingView = fromXib()
        
        workingView.layer.backgroundColor = UIColor.blue.cgColor
        
        workingView.layer.cornerRadius = frame.size.height / 2
//        workingView.clipsToBounds = true
        
        addSubview(workingView)
    }
}
