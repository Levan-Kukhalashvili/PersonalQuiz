//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 26.10.2020.

import UIKit

class ResultsViewController: UIViewController {
    
    var answersChoosen: [Answer] = []
    
    @IBOutlet var myLable: UILabel! {
        didSet {
            let myLable = sorting()
            self.myLable.text = String("Вы - \(myLable.rawValue)!")
        }
    }
    
    @IBOutlet var descriptionMy: UILabel! {
        didSet {
            let descriptionMy = sorting()
            self.descriptionMy.text = descriptionMy.definition
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
    }
    
    private func sorting() -> AnimalType {
        var quantity: [AnimalType: Int] = [.dog: 0, .cat: 0, .rabbit: 0, .turtle: 0]
        
        for choosen in answersChoosen {
            quantity[choosen.type] = quantity[choosen.type]! + 1
        }
        
        let result = (quantity.max { a, b in a.value < b.value })!
        return result.key
    }
}
