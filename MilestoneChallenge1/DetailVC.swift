//
//  DetailVC.swift
//  MilestoneChallenge1
//
//  Created by Noah Pope on 1/10/25.
//

import UIKit

class DetailVC: UIViewController
{
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?

    override func viewDidLoad()
    {
        super.viewDidLoad()
        setUpNavigation()
    }

    
    func setUpNavigation()
    {
        navigationItem.largeTitleDisplayMode = .never
        title   = selectedImage
        
    }
}
