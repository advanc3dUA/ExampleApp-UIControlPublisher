//
//  UISlider+valuePublisher.swift
//  ExampleApp-UIControlPublisher
//
//  Created by Yuriy Gudimov on 29.01.2023.
//

import UIKit
import Combine

extension UISlider {
    var valuePublisher: AnyPublisher<Float, Never> {
        publisher(for: .valueChanged)
            .map { $0.value }
            .merge(with: Just(value))
            .eraseToAnyPublisher()
    }
}

