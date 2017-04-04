//
//  OrganViewController.swift
//  Body
//
//  Created by Matteo Palmieri on 03/04/17.
//  Copyright © 2017 iOSFoundation. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class OrganViewController: UIViewController {
    var Heart: SCNNode!
    var nameModel: String!
    var nameScene = "art.scnassets/"    
    
    @IBOutlet weak var sceneViewHeart: SCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // create a new scene
        let scene = SCNScene(named: "art.scnassets/Human_Heart.scn")!
        
        // create and add a camera to the scene
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        scene.rootNode.addChildNode(cameraNode)
        
        // place the camera
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 30)
        
        // create and add a light to the scene
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light!.type = .omni
        lightNode.position = SCNVector3(x: 0, y: 10, z: 10)
        scene.rootNode.addChildNode(lightNode)
        
        // retrieve the ship node
        Heart = scene.rootNode.childNode(withName: "Human_Heart", recursively: true)!
        
        // animate the 3d object
        Heart.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 2, z: 0, duration: 1)))
        
        
        sceneViewHeart.scene = scene
        
        sceneViewHeart.allowsCameraControl = true
        
        sceneViewHeart.showsStatistics = true
        
        sceneViewHeart.backgroundColor = UIColor.white
        //sceneViewHeart.accessibilityPerformMagicTap()
        //sceneViewHeart.tap
        
        // add a tap gesture recognizer
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(OrganViewController.handleTap(_:)))
        var gestureRecognizers = [UIGestureRecognizer]()
        gestureRecognizers.append(tapGesture)
        if let existingGestureRecognizers = self.view.gestureRecognizers {
            gestureRecognizers.append(contentsOf: existingGestureRecognizers)
        }
        self.view.gestureRecognizers = gestureRecognizers
    }
    
    /*override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        Heart.removeAllActions()
    }*/
    
    func handleTap(_ gestureRecognize: UIGestureRecognizer) {
        // retrieve the SCNView
        Heart.removeAllActions()
        let scnView = sceneViewHeart
        
        // check what nodes are tapped
        let p = gestureRecognize.location(in: scnView)
        
        let hitResults = sceneViewHeart.hitTest(p, options: [:])
        // check that we clicked on at least one object
        if hitResults.count > 0 {
            // retrieved the first clicked object
            let result: AnyObject = hitResults[0]
            
            // get its material
            let material = result.node!.geometry!.firstMaterial!
            
            // highlight it
            SCNTransaction.begin()
            SCNTransaction.animationDuration = 0.5
            
            // on completion - unhighlight
            SCNTransaction.completionBlock = {
                SCNTransaction.begin()
                SCNTransaction.animationDuration = 0.5
                
                material.emission.contents = UIColor.black
                
                SCNTransaction.commit()
            }
            
            material.emission.contents = UIColor.red
            
            SCNTransaction.commit()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
}
