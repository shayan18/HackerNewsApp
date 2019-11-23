//
//  StoryManager.swift
//  HackerNews
//
//  Created by Shayan Ali on 23/11/2019.
//  Copyright © 2019 Shayan Ali. All rights reserved.
//

import Foundation

class StoryManager {
    
    static func getStoriesList(completion: @escaping (APIResult<[Int]>)-> Void) {
        
        Providers.storyProvider.request(.getStoriesList) {  (result) in
            switch result {
            case .success(let response):
                do {
                    let storiesList : [Int] = try JSONDecoder().decode([Int].self, from: response.data)
                    
                    completion(.success(storiesList))
                    
                }
                catch {
                    completion(.failure(error.localizedDescription))
                }
                
            case .failure(let error):
                completion(.failure(error.localizedDescription))
                
            }
        }
    }
    
    
    static func getStory(id: Int, completion: @escaping (APIResult<Story>)-> Void) {
          
          Providers.storyProvider.request(.getStory(id: id)) {  (result) in
              switch result {
              case .success(let response):
                  do {
                      let story : Story = try JSONDecoder().decode(Story.self, from: response.data)
                      
                      completion(.success(story))
                      
                  }
                  catch {
                      completion(.failure(error.localizedDescription))
                  }
                  
              case .failure(let error):
                  completion(.failure(error.localizedDescription))
                  
              }
          }
      }
      
    }
