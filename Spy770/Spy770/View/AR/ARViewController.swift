//
//  ARViewController.swift
//  Spy770
//
//  Created by Nathan Baptista Schostack on 16/04/24.
//

import UIKit
import SceneKit
import ARKit

class ARViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        // Create ARSCNView instance programmatically
        sceneView = ARSCNView(frame: view.bounds)
        sceneView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the ARSCNView to the view hierarchy
        view.addSubview(sceneView)
        
        // Add constraints to make ARSCNView fill the parent view
        NSLayoutConstraint.activate([
           sceneView.topAnchor.constraint(equalTo: view.topAnchor),
           sceneView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
           sceneView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
           sceneView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Enable default lighting
        sceneView.autoenablesDefaultLighting = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARImageTrackingConfiguration()
        
        // Set the AR reference images
        if let imageToTrack = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: Bundle.main) {
            
            configuration.trackingImages = imageToTrack
            configuration.maximumNumberOfTrackedImages = 2
            
            print("AR Markers Added!")
        }

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
   
    // Override to create and configure nodes for anchors added to the view's session.
        func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
            let node = SCNNode()
        
            // Perform tasks on the background thread
            DispatchQueue.global().async { [weak self] in
        
                // Check if the detected anchor is an ARImageAnchor
                if let imageAnchor = anchor as? ARImageAnchor {

                    if let pineappleScene = SCNScene(named: "Pineapple.scn") {
                                
                        if let pineappleNode = pineappleScene.rootNode.childNodes.first {
                            
                            pineappleNode.eulerAngles.x = -.pi / 2
                            
                            // Adding nodes on the main thread
                            DispatchQueue.main.async {
                                node.addChildNode(pineappleNode)
                            }
                        }
                    }
                }
            }
            
            return node
        }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
