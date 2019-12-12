//
//  ConcurrentOperations.swift
//  LearnOperations
//
//  Created by Niraj on 12/12/2019.
//  Copyright © 2019 Ashwatthaama. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(Error)
}

class ConcurrentOperations<T>: Operation {

    typealias OperationCompletionHandler = (_ result: Result<T>) -> Void

    var completionHandler: (OperationCompletionHandler)?

    func complete(result: Result<T>) {
        finish()

        if !isCancelled {
            completionHandler?(result)
        }
    }

    private enum State: String {
        case ready = "isReady"
        case executing = "isExecuting"
        case finished = "isFinished"
    }

    private var state: State = .ready {
        willSet {
            willChangeValue(forKey: newValue.rawValue)
            willChangeValue(forKey: state.rawValue)
        }
        didSet {
            didChangeValue(forKey: oldValue.rawValue)
            didChangeValue(forKey: state.rawValue)
        }
    }

    override var isReady: Bool {
        return super.isReady && state == .ready
    }

    override var isExecuting: Bool {
        return state == .executing
    }

    override var isFinished: Bool {
        return state == .finished
    }

    override func start() {
        guard !isCancelled else {
            finish()
            return
        }

        if !isExecuting {
            state = .executing
        }

        main()
    }

    func finish() {
        if isExecuting {
        state = .finished
        }
    }

    override func cancel() {
        super.cancel()
        finish()
    }
}
