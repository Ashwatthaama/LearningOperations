//
//  QuestionDataManager.swift
//  LearnOperations
//
//  Created by Niraj on 12/12/2019.
//  Copyright © 2019 Ashwatthaama. All rights reserved.
//

import UIKit

class QuestionDataManager: QueueManager {

    private let queueManager: QueueManager

    init(withQueueager queueManager: QueueManager = QueueManager.sharedInstance()) {
        self.queueManager = queueManager
    }

    func retrieveQuestions(pageIndex:Int, completionHandler: @escaping (_ result: Result<QuestionPage>) -> Void) {
        let operation = QuestionRetrivalOperation(pageIndex: pageIndex)
        operation.completionHandler = completionHandler
        queueManager.enqueue(operation)
    }

}
