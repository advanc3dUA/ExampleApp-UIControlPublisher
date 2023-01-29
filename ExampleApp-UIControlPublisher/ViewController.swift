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
        colorPublisher.assign(to: \.backgroundColor, on: view)
            .store(in: &cancellables)
    }
    
    var colorPublisher: AnyPublisher<UIColor?, Never> {
        Publishers.CombineLatest3(
            r.valuePublisher,
            g.valuePublisher,
            b.valuePublisher
        )
        .map { values in
            UIColor(red: CGFloat(values.0), green: CGFloat(values.1), blue: CGFloat(values.2), alpha: 1.0) as UIColor?
        }
        .eraseToAnyPublisher()
    }
}


