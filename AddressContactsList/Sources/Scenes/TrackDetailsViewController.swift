//
//  TrackDetailsViewController.swift
//  AddressContactsList
//
//  Created by Artyom Guzenko on 11.11.2022.
//

import UIKit

class TrackDetailsViewController: UIViewController {

    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    
    var track: Track!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coverImageView.image = UIImage(named: track.title)
        trackNameLabel.text = track.title
    }
}
