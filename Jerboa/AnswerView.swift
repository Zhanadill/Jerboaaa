//
//  AnswerView.swift
//  Jerboa
//
//  Created by Жанадил on 3/23/21.
//  Copyright © 2021 Жанадил. All rights reserved.
//

import UIKit

protocol AnswerDelegate: class {
    func tapAnswer(aaa: Int)
}

@IBDesignable class AnswerView: UIView {
    var view: UIView!
    var nibName: String = "AnswerView"
    weak var answerDelegate: AnswerDelegate?
    //@IBOutlet weak var img1: UIImageView!
    //@IBOutlet weak var img2: UIImageView!
    //@IBOutlet weak var img3: UIImageView!
    //@IBOutlet weak var img4: UIImageView!
    
    
    override func prepareForInterfaceBuilder() {
        setup()
    }
    
    @IBAction func subviewPressed1(_ sender: UIView) {
        if sender.restorationIdentifier == "1"{
            answerDelegate?.tapAnswer(aaa: 0)
            //flip(view: sender, img: img1)
        }else if sender.restorationIdentifier == "2"{
            answerDelegate?.tapAnswer(aaa: 1)
            //flip(view: sender, img: img2)
        }else if sender.restorationIdentifier == "3"{
            answerDelegate?.tapAnswer(aaa: 2)
            //flip(view: sender, img: img3)
        }else{
            answerDelegate?.tapAnswer(aaa: 3)
            //flip(view: sender, img: img4)
        }
        
    
    }
    
   /* func flip(view: UIView, img: UIImageView){
           UIView.transition(with: view,
                             duration: 0.35,
                             options: [.transitionFlipFromRight, .showHideTransitionViews],
                             animations: { img.image = UIImage(named: "img5") },
                             completion: nil)
       }*/
    
    override init(frame: CGRect) {
           super.init(frame: frame)
       }
       
       required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
           setup()
       }
       
       func loadFromNib() -> UIView {
           let bundle = Bundle(for: type(of: self))
           let nib = UINib(nibName: nibName, bundle: bundle)
           let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
           
           return view
       }
       
       func setup(){
           view = loadFromNib()
           view.frame = bounds
           view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
           addSubview(view)
       }

}
