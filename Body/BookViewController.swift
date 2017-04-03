//
//  BookViewController.swift
//  NavigationController
//
//  Created by Carmine Massei on 19/03/17.
//  Copyright © 2017 iOSFoundation. All rights reserved.
//

import UIKit

class BookViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var author: String?

    @IBOutlet var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.reloadData()
        print(author ?? "ko")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return b.countBooks(author: author!)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCollectionViewCell", for: indexPath) as! ItemCollectionViewCell
        
        cell.itemImageView.image = UIImage(named: b.getImage(author: author!, index: indexPath.row))
        return cell 
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "bookDetail", sender: self)
    }
    

    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == "bookDetail"{
            let indexPath = (collectionView.indexPathsForSelectedItems?[0])! as IndexPath
            let destination = segue.destination as? ThirdViewController
            destination?.id = b.getID(author: author!, index: indexPath.row)
        }
    }

}
