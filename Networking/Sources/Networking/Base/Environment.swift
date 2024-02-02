//
//  Environment.swift
//
//
//  Created by Ahmed Ali on 28/01/2024.
//

import Foundation
/// A utility for accessing environment-specific configuration from the app's Info.plist.
public enum Environment {
    private enum PlistKeys {
        static let baseURL = "SERVER_URL"
        static let imageBaseURL = "SERVER_IMAGE_URL"
        static let apiKey = "API_KEY"
    }
    /// Retrieve information from the app's Info.plist file.
    private static var infoDictionary: [String: Any] {
        guard let dict = Bundle.main.infoDictionary else {
            preconditionFailure("Plist file not found")
        }
        return dict
    }
    /// The base URL for the server.
    static var baseURL: URL {
        guard let rootURLString = Environment.infoDictionary[PlistKeys.baseURL] as? String else {
            preconditionFailure("Root URL not set in plist for this environment")
        }
        guard let url = URL(string: "https://\(rootURLString)") else {
            preconditionFailure("Invalid URL")
        }
        return url
    }
    /// The base URL for the server's image resources.
    public static var baseImagePath: String {
        guard let rootURLString = Environment.infoDictionary[PlistKeys.imageBaseURL] as? String else {
            preconditionFailure("Root URL not set in plist for this environment")
        }
        return "https://\(rootURLString)"
    }
    /// The API key  used for authentication or authorization.
    public static var apiKey: String {
        guard let apiKey = Environment.infoDictionary[PlistKeys.apiKey] as? String else {
            preconditionFailure("API Key not set in plist for this environment")
        }
        return apiKey
    }
}
