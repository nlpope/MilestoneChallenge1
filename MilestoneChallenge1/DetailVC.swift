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
    var selectedImageString: String?

    override func viewDidLoad()
    {
        super.viewDidLoad()
        setUpNavigation()
        loadImage()
    }

    
    func setUpNavigation()
    {
        navigationItem.largeTitleDisplayMode = .never
        title   = selectedImageString
        navigationItem.rightBarButtonItem   = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
    }
    
    
    func loadImage()
    {
        if let imageToLoad  = selectedImageString {
            imageView.image = UIImage(named: imageToLoad)
        }
        
        assert(selectedImageString != nil, "selectedImage has no value")
    }
    
    
    @objc func shareTapped()
    {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8)
        else { print("no img found"); return }
        
        let vc          = UIActivityViewController(activityItems: [image, selectedImageString!], applicationActivities: [])
//        vc.popoverPresentationController?.sourceItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}
