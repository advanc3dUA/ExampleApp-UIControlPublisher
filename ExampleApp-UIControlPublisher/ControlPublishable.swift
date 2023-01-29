//
//  ControlPublishable.swift
//  ExampleApp-UIControlPublisher
//
//  Created by Yuriy Gudimov on 29.01.2023.
//

import UIKit

protocol ControlPublishable { }
extension UIControl: ControlPublishable { }
extension ControlPublishable where Self: UIControl {
    func publisher(for event: UIControl.Event) -> UIControlPublisher<Self> {
        UIControlPublisher(control: self, event: event)
    }
}
