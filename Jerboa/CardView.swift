//
//  CardView.swift
//  Jerboa
//
//  Created by Жанадил on 3/22/21.
//  Copyright © 2021 Жанадил. All rights reserved.
//

import UIKit

@IBDesignable class CardView: UIView {
    var view: UIView!
    var nibName: String = "CardView"
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var label: UILabel!
    //let arr = ["img1", "img2", "img3", "img4", "img5"]
    /*var k: Int = 1 {
        didSet {
            if k == arr.count {
                k = 0
            }
        }
    }*/
    
    override func prepareForInterfaceBuilder() {
        setup()
    }
    
    @IBAction func viewPressed(_ sender: UIView) {
        flip()
    }
    
    func flip(){
        if label.isHidden == true{
            UIView.transition(with: img1,
                              duration: 0.35,
                              options: [.transitionFlipFromRight, .showHideTransitionViews],
                              //animations: { self.img1.image = UIImage(named: "\(self.arr[self.k])") },
                              animations: {
                                self.img1.isHidden = true;
                                self.label.isHidden = false
                              },
                              completion: nil)
            //k+=1
        }else{
            UIView.transition(with: img1,
                              duration: 0.35,
                              options: [.transitionFlipFromRight, .showHideTransitionViews],
                              //animations: { self.img1.image = UIImage(named: "\(self.arr[self.k])") },
                              animations: {
                                self.label.isHidden = true;
                                self.img1.isHidden = false
                              },
                              completion: nil)
        }
    }
    
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

