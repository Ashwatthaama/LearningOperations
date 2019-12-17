//
//  QuestionRetrivalOperation.swift
//  LearnOperations
//
//  Created by Niraj on 12/12/2019.
//  Copyright © 2019 Ashwatthaama. All rights reserved.
//

import UIKit

class QuestionRetrivalOperation: ConcurrentOperations<QuestionPage>, PersistenceProtocol {

    private let urlSession: URLSession
    private var task: URLSessionTask?
    private let pageIndex: Int
    private let urlRequestFactory: QuestionsURLRequestFactory
    let persistenceManager = PersistenceService.sharedInstance()

    var pages: QuestionPage?

    init(session: URLSession = URLSession.shared, urlRequestFactory: QuestionsURLRequestFactory = QuestionsURLRequestFactory(), pageIndex: Int) {
        self.urlSession = session
        self.urlRequestFactory = urlRequestFactory
        self.pageIndex = pageIndex
    }

    override func main() {
        let urlRequest = urlRequestFactory.requestToRetrieveQuestions(pageIndex: pageIndex)

        task = urlSession.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data else {
                DispatchQueue.main.async {
                    if let error = error {
                        self.complete(result: .failure(error))
                    } else {
                        self.complete(result: .failure(APIError.missingData))
                    }
                }
                return
            }

            do {
                try self.saveData(data)
                DispatchQueue.main.async {
                    self.complete(result: .success(self.pages!))

                }
            } catch {
                DispatchQueue.main.async {
                    self.complete(result: .failure(APIError.serialization))
                }
            }
        }
        task?.resume()
    }

    override func cancel() {
        task?.cancel()
        super.cancel()
    }

    func saveData(_ data: Data) throws {

        let decoder = JSONDecoder()
        decoder.userInfo[CodingUserInfoKey.context] = persistenceManager.context
        do {
            pages = try decoder.decode(QuestionPage.self, from: data)
            print("________,\(pages)")
            persistenceManager.saveContext()
        }
        catch {
            print("Error")
        }
    }


}
