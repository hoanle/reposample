//
//  GithubRepo.swift
//  GithubDemo
//
//  Created by Nhan Nguyen on 5/12/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import Foundation

private let params = []
private let query: String! = "stars:>0".stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding);
private let resourceUrl = "https://api.github.com/search/repositories?q=\(query)&sort=stars&order=desc"

class GithubRepo {
    var name: String?
    var ownerHandle: String?
    var ownerAvatarURL: String?
    var stars: Int?
    var forks: Int?
    
    
    init(jsonResult: NSDictionary) {
        if let name = jsonResult["name"] as? String {
            self.name = name
        }
        
        if let stars = jsonResult["stargazers_count"] as Int? {
            self.stars = stars
        }
        
        if let forks = jsonResult["forks_count"] as Int? {
            self.forks = forks
        }
        
        if let owner = jsonResult["owner"] as? NSDictionary {
            if let ownerHandle = owner["login"] as? String {
                self.ownerHandle = ownerHandle
            }
            if let ownerAvatarURL = owner["avatar_url"] as? String {
                self.ownerAvatarURL = ownerAvatarURL
            }
        }
    }
    
    class func fetchRepos(successCallback: ([GithubRepo]) -> Void, error: ((NSError?) -> Void)?) {
        let manager = AFHTTPRequestOperationManager()
        
        println(resourceUrl)
        
        manager.GET(resourceUrl, parameters: params, success: { (operation ,responseObject) -> Void in
            if let results = responseObject["items"] as? NSArray {
                var repos: [GithubRepo] = []
                for result in results as [NSDictionary] {
                    repos.append(GithubRepo(jsonResult: result))
                }
                successCallback(repos)
            }
        }, failure: { (operation, requestError) -> Void in
            if let errorCallback = error? {
                errorCallback(requestError)
            }
        })
    }
}