//
//  QueueManager.swift
//  LearnOperations
//
//  Created by Niraj on 12/12/2019.
//  Copyright © 2019 Ashwatthaama. All rights reserved.
//

import UIKit

class QueueManager {

    lazy var queue: OperationQueue = {
        let queue = OperationQueue()
        return queue
    }()

    /// Singleton

    private static let _sharedInstance: QueueManager = QueueManager()

    class func sharedInstance() -> QueueManager {
        return _sharedInstance
    }

    func enqueue(_ operation:Operation) {
        queue.addOperation(operation)
    }

}
