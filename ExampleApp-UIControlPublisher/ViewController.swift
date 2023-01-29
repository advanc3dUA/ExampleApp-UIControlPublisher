//
//  ViewController.swift
//  ExampleApp-UIControlPublisher
//
//  Created by Yuriy Gudimov on 29.01.2023.
//

import UIKit
import Combine

class ViewController: UIViewController {

    @IBOutlet weak var r: UISlider!
    @IBOutlet weak var g: UISlider!
    @IBOutlet weak var b: UISlider!
    
    private var cancellables: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}


