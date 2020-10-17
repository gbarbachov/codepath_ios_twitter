//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Grigori on 10/9/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var favorButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    
    var favorited:Bool = false
    var tweetId: Int = -1

    
    @IBAction func favoriteTweet(_ sender: Any) {
        let toBeFavorited = !favorited
            if(toBeFavorited){
                    TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                        self.setFavorite(true)
                    }, failure: { (error) in
                        print("Favorite method did not succeed: \(error)")
                    })
                }
            else {
                        TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                            self.setFavorite(false)
                        }, failure: { (error) in
                            print("Unfavorite method did not succeed: \(error)")
                        })
                }

        
    }
    
    
    func setFavorite(_ isFavorited: Bool) {
            favorited = isFavorited
            if(favorited){
                favorButton.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
                }
            else{
                favorButton.setImage(UIImage(named:"favor-icon-1"), for: UIControl.State.normal)
            }
        }
    
    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
                    self.setRetweeted(true)
                }, failure: { (error) in
                    print("Error retweeting: \(error)")
                })

    }
       
    func setRetweeted(_ isRetweeted: Bool) {
           if(isRetweeted){
               retweetButton.setImage(UIImage(named:"retweet-icon-green"), for: UIControl.State.normal)
               retweetButton.isEnabled = false
           }
           else{
               retweetButton.setImage(UIImage(named:"retweet-icon"), for: UIControl.State.normal)
               retweetButton.isEnabled = true
           }
       }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
