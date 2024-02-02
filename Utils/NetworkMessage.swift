//
//  ErrorMessage.swift
//  Bankey
//
//  Created by Elif İlay KANDEMİR on 2.02.2024.
//

import Foundation

enum NetworkError: String, Error {
    
    case invalidURL
    case serverError
    case invalidURLRequest
    case requestFailed
    case noConnection
    case decodingError
    
    var title: String {
        switch self {
        case .invalidURL:
            return NSLocalizedString("URL Error", comment: "Title for invalid URL error")
        case .serverError:
            return NSLocalizedString("Server Error", comment: "Title for server error")
        case .invalidURLRequest:
            return NSLocalizedString("Request Error", comment: "Title for invalid request error")
        case .requestFailed:
            return NSLocalizedString("Request Failed", comment: "Title for request failed error")
        case .noConnection:
            return NSLocalizedString("No Internet Connection", comment: "Title for no connection error")
        case .decodingError:
            return NSLocalizedString("Decoding Error", comment: "Title for decoding error")
        }
    }
    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return NSLocalizedString("The URL provided was invalid.", comment: "")
        case .serverError:
            return NSLocalizedString("The server responded with an error.", comment: "")
        case .invalidURLRequest:
            return NSLocalizedString("The request was improperly formatted.", comment: "")
        case .requestFailed:
            return NSLocalizedString("The request failed due to an unknown error.", comment: "")
        case .noConnection:
            return NSLocalizedString("Please check your internet connection and try again.", comment: "")
        case .decodingError:
            return NSLocalizedString("Failed to decode the response. Please check your data.", comment: "")
        }
    }
}
