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
        
        for item in items { if item.hasPrefix("nssl") { pictures.append(item)} }
    }
}

