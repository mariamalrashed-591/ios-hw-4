//
//  ViewController.swift
//  ios-hw-4
//
//  Created by Mariam on 10/4/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var  table: UITableView!

    var songs = [Song]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSongs()
        table.delegate = self
        table.dataSource = self
        // Do any additional setup after loading the view.
    }
    func configureSongs(){
        songs.append(Song(name: "ولهان", albumName: "", artistName: "راشد الماجد", imageName: "cover1", trackName: "song1"))
        songs.append(Song(name: "ما كان هذا حب", albumName: "", artistName: "عبالمجيد عبدالله", imageName: "cover2", trackName: "song2"))
        songs.append(Song(name: "ولهان", albumName: "", artistName: "ماجد المهندس", imageName: "cover3", trackName: "song3"))
        songs.append(Song(name: "لو على قلبي", albumName: "", artistName: "فضل شاكر", imageName: "cover4", trackName: "song4"))
        
        
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let song = songs[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.albumName
        cell.imageView?.image = UIImage(named: song.imageName)
        
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 30)
        cell.detailTextLabel?.font = UIFont(name: "Helvetica", size: 16)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let position = indexPath.row
        guard let vc = storyboard?.instantiateViewController(identifier: "player") as? PlayerVC else {
            return
        }
        vc.songs = songs
        vc.position = position
        present(vc, animated: true)
    }
    

}

struct Song {
    let name: String
    let albumName: String
    let artistName: String
    let imageName: String
    let trackName: String
    
}
