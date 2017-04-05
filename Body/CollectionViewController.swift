//
//  CollectionViewController.swift
//  Body
//
//  Created by Alessandro Armando on 04/04/17.
//  Copyright © 2017 iOSFoundation. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var myCollection: UICollectionView!
    
    let allNameModels = ["Human_Heart","Brain_Model","eyeball","lungs","liver","stomach", "pancreas","gallbladder","kidneys"]
    let allImageModels = ["heart","brain","eye","lungs","liver","stomach","pancreas","gallbladder","kidneys"]
    let allDescription = ["The heart is a muscular organ in humans and other animals, which pumps blood through the blood vessels of the circulatory system. Blood provides the body with oxygen and nutrients, as well as assists in the removal of metabolic wastes. In humans, the heart is located between the lungs, in the middle compartment of the chest. In humans, other mammals, and birds, the heart is divided into four chambers: upper left and right atria; and lower left and right ventricles.[4][5] Commonly the right atrium and ventricle are referred together as the right heart and their left counterparts as the left heart.", "The brain is an organ that serves as the center of the nervous system in all vertebrate and most invertebrate animals. The brain is located in the head, usually close to the sensory organs for senses such as vision. The brain is the most complex organ in a vertebrate's body. In a human, the cerebral cortex contains approximately 15–33 billion neurons, each connected by synapses to several thousand other neurons.", "Eyes are organs of the visual system. They provide organisms vision, the ability to process visual detail, as well as enabling several photo response functions that are independent of vision. Eyes detect light and convert it into electro-chemical impulses in neurons. In higher organisms, the eye is a complex optical system which collects light from the surrounding environment, regulates its intensity through a diaphragm, focuses it through an adjustable assembly of lenses to form an image, converts this image into a set of electrical signals.","lungs","liver","stomach","pacnreas","gallbladder","kidneys"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myCollection.dataSource = self
        myCollection.delegate = self
        myCollection.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 50.0, left: 50.0, bottom: 50.0, right: 50.0)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allNameModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! CollectionViewCell
        cell.imageForChoice.image = UIImage(named: allImageModels[indexPath.row])
        cell.imageForChoice.frame = CGRect(x : 0, y : 0, width: 350, height: 350)
        //aspect
        cell.imageForChoice.layer.masksToBounds = false
        cell.imageForChoice.clipsToBounds = false;
        cell.imageForChoice.layer.shadowOffset = CGSize(width: 0.0, height: -3.0)
        cell.imageForChoice.layer.shadowColor = UIColor.black.cgColor
        cell.imageForChoice.layer.shadowRadius = 10
        cell.imageForChoice.layer.shadowOpacity = 1
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mySceneToShow = storyboard?.instantiateViewController(withIdentifier: "OVC") as! OrganViewController
        if indexPath.row < 3{ //controllo perche' solo i primi tre hanno un modello 3d
            mySceneToShow.loadModel(nameModel: allNameModels[indexPath.row])
            mySceneToShow.loadDescription(des: allDescription[indexPath.row])
            self.present(mySceneToShow, animated: true, completion: nil)
        }
        
    }

}
