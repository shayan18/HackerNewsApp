//
//  StoryTableViewCell.swift
//  HackerNews
//
//  Created by Shayan Ali on 23/11/2019.
//  Copyright © 2019 Shayan Ali. All rights reserved.
//

import UIKit
class StoryTableViewCell: UITableViewCell {
    // MARK: Outlets
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var authorLabel: UILabel!
    @IBOutlet weak private var scoreLabel: UILabel!
    @IBOutlet weak private var timeLabel: UILabel!
    
    
    var id: Int! {
        didSet {
            getStoryDetails(id)
        }
    }
    
    private var storyViewModel: StoryViewModel! {
        didSet {
            self.authorLabel.text = storyViewModel.by
            self.titleLabel.text = storyViewModel.title
            self.scoreLabel.text = "\(storyViewModel.score)"
            self.timeLabel.text = storyViewModel.time
        }
    }
    override func prepareForReuse() {
        self.authorLabel.text = ""
        self.titleLabel.text = ""
        self.scoreLabel.text = ""
        self.timeLabel.text = ""
    }

    private func getStoryDetails(_ id: Int) {
        StoryManager.getStory(id: id) { [weak self] (result) in
            switch result {
            case .success(let story):
            self?.storyViewModel = StoryViewModel(story: story)
                print(story)
            case .failure(let error):
                self?.authorLabel.text = error
                self?.titleLabel.text = ""
                self?.scoreLabel.text = ""
                self?.timeLabel.text = ""
            }
        }
    }
    
    func didSelect(indexPath: IndexPath, completion: @escaping (String)-> Void) {
        if let url = storyViewModel.url {
            completion(url)
        }
    }
}
