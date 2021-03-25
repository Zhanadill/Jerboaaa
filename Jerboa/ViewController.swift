//
//  ViewController.swift
//  Jerboa
//
//  Created by Жанадил on 3/22/21.
//  Copyright © 2021 Жанадил. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    @IBOutlet weak var cardImage: CardView!
    @IBOutlet weak var answerImage: AnswerView!
    @IBOutlet weak var resultView: UIStackView!
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    
    let arr = ["img1", "img2", "img3", "img4"]
    let arr2 = ["label1", "label2", "label3", "label4"]
    var count = 0
    var answer = 0 {
        didSet {
            if answer == arr.count {
                answer = 0
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerImage.answerDelegate = self
    }
    
}

extension ViewController: AnswerDelegate {
    func tapAnswer(aaa: Int) {
        if answer == aaa {
            count += 1
            resultImage.image = UIImage(systemName: "checkmark")
            view.backgroundColor = UIColor.green
            resultLabel.text = "\(count)"
        }else{
            resultImage.image = UIImage(systemName: "exclamationmark")
            view.backgroundColor = UIColor.red
            count = 0
            resultLabel.text = "\(count)"
        }
        
        cardImage.isHidden = true
        answerImage.isHidden = true
        resultView.isHidden = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.resultView.isHidden = true
            self.cardImage.isHidden = false
            self.answerImage.isHidden = false
            self.view.backgroundColor = UIColor.white
        }
        answer += 1
        cardImage.label.text = arr2[answer]
        cardImage.img1.image = UIImage(named: arr[answer])
    }
}



