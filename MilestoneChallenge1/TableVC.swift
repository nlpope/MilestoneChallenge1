//
//  TableVC.swift
//  MilestoneChallenge1
//
//  Created by Noah Pope on 1/10/25.
//

import UIKit

class TableVC: UITableViewController
{
    var pictures = [String]()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        setUpNavigation()
        loadBundle()
    }
    
    
    func setUpNavigation()
    {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Flag Viewer"
    }


    func loadBundle()
    {
        let fm      = FileManager.default
        let path    = Bundle.main.resourcePath!
        let items   = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items { if item.hasSuffix(".png") { pictures.append(item)} }
    }
}


// MARK: TABLEVIEW DELEGATE METHODS

extension TableVC
{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell    = tableView.dequeueReusableCell(withIdentifier: "FlagCell", for: indexPath)
        let picture = pictures[indexPath.row]
        cell.textLabel?.text = picture
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as? DetailVC {
            vc.selectedImageString = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

