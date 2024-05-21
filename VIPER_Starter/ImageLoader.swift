//
//  ImageLoader.swift
//  VIPER_Starter
//
//  Created by Davit on 08.04.24.
//

import Foundation

protocol ImageLoader {
    func loadImageData(from url: URL, completion: @escaping ((Result<Data, Error>) -> Void)) -> ImageLoaderDataTask
}

protocol HTTPClient {
    func dataTask(
        with request: URLRequest,
        completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void
    ) -> URLSessionDataTask
}

protocol ImageLoaderDataTask {
    func cancel()
    func resume()
}

extension URLSessionDataTask: ImageLoaderDataTask { }

extension URLSession: HTTPClient { }

class RemoteImageLoader: ImageLoader {
    private let client: HTTPClient
    
    init(client: HTTPClient = URLSession.shared) {
        self.client = client
    }
    
    func loadImageData(from url: URL, completion: @escaping ((Result<Data, Error>) -> Void)) -> ImageLoaderDataTask {
        let task = client.dataTask(with: <#T##URLRequest#>, completionHandler: <#T##(Data?, URLResponse?, Error?) -> Void#>)
        
        return task
    }
}
