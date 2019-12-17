//
//  ViewController.swift
//  LearnOperations
//
//  Created by Niraj on 12/12/2019.
//  Copyright © 2019 Ashwatthaama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let questionManager = QuestionDataManager()

        for i in 0...1 {
            questionManager.retrieveQuestions(pageIndex: i) { result in
                switch result {
                case .success(let page):
                    print(page)
                case .failure(let error):
                    print(error)
                }
            }
        }

    }


}

