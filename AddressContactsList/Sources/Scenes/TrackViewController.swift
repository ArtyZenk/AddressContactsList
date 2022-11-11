//
//  TrackViewController.swift
//  AddressContactsList
//
//  Created by Artyom Guzenko on 04.11.2022.
//

import UIKit

class TrackViewController: UITableViewController {
    
    private let trackList = Track.getTrackList()
    
     // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        trackList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "track", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        let track = trackList[indexPath.row]
        
        content.text = track.song
        content.secondaryText = track.artist
        content.image = UIImage(named: track.title)
        content.imageProperties.cornerRadius = tableView.rowHeight / 2
        
        cell.contentConfiguration = content
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailsVC = segue.destination as? TrackDetailsViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        detailsVC.track = trackList[indexPath.row]
    }
}
