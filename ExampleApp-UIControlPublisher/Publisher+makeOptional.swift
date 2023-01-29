//
//  Publisher+makeOptional.swift
//  ExampleApp-UIControlPublisher
//
//  Created by Yuriy Gudimov on 29.01.2023.
//

import Foundation
import Combine

extension Publisher {
    func makeOptional() -> Publishers.Map<Self, Output?> {
        return map { $0 }
    }
}
