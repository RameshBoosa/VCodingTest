//
//  NetworkLayer.swift
//  VCodingTest
//
//  Created by Ramesh Boosa on 3/16/23.
//

import Foundation

/**
 A protocol defining method for fetching schools data from a URL using a URLSession.
 */
protocol SchoolsDelegate {
    
    /**
     Fetches schools data from a given URL using the provided URLSession.
     
     - Parameters:
     - url: The URL to fetch the data from.
     - session: The URLSession to use for the network request.
     - Throws: An error if the network request fails or if there is an error decoding the data.
     - Returns: The Schools data fetched from the URL.
     */
    static func fetchSchools(from url: URL, using session: URLSession) async throws -> Schools
}

/**
 A protocol defining method for fetching schools data from a URL using a URLSession.
 */
protocol ResultsDelegate {
    
    /**
     Fetches results data from a given URL using the provided URLSession.
     
     - Parameters:
     - url: The URL to fetch the data from.
     - session: The URLSession to use for the network request.
     - Throws: An error if the network request fails or if there is an error decoding the data.
     - Returns: The Results data fetched from the URL.
     */
    static func fetchResults(from url: URL, using session: URLSession) async throws -> Results
}

struct NetworkLayer: SchoolsDelegate, ResultsDelegate {
    
    // It's bit confusing in assignment. email it's mentioned use third party library anywhere in app but i really don't real usage of any third party library other than api call. I used latest async/await insted of using any third party like Almofire with Future Promise Kit
    
    @discardableResult
    static func fetchSchools(from url: URL, using session: URLSession) async throws -> Schools {
        let (data, _) = try await session.data(from: url)
        return try  JSONDecoder().decode(Schools.self, from: data)
    }
    
    @discardableResult
    static func fetchResults(from url: URL, using session: URLSession) async throws -> Results {
        let (data, _) = try await session.data(from: url)
        return try JSONDecoder().decode(Results.self, from: data)
    }
}
