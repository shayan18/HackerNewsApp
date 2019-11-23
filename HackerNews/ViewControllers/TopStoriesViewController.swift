//
//  ViewController.swift
//  HackerNews
//
//  Created by Shayan Ali on 23/11/2019.
//  Copyright © 2019 Shayan Ali. All rights reserved.
//

import UIKit

class TopStoriesViewController: UIViewController {
    @IBOutlet weak private var tableView: UITableView!
    private var topStoryIds = [Int]()
    override func viewDidLoad() {
        super.viewDidLoad()
         tableView.register(cellType: StoryTableViewCell.self)
         getTopStoryIds()
    }
}

extension TopStoriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topStoryIds.count >= 20 ? 20 : topStoryIds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(with: StoryTableViewCell.self, for: indexPath) as StoryTableViewCell
        cell.id = topStoryIds[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) as? StoryTableViewCell {
            cell.didSelect(indexPath: indexPath) { [weak self] (url) in
                let vc = ArticleInfoViewController.instantiate()
                vc.articleUrl = url
                self?.navigationController?.pushViewController(vc, animated: true)
            }
         
        }
        
    }
}

extension TopStoriesViewController {
    
    private func getTopStoryIds() {
        StoryManager.getStoriesList { [weak self] (result) in
            switch result {
            case .success(let storyIds):
                self?.topStoryIds = storyIds
                self?.tableView.reloadData()
                
            case .failure(let error):
                self?.showAlert(message: error)
            }
        }
    }
}
