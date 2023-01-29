//
//  Combine+UIControlPublisher.swift
//  ExampleApp-UIControlPublisher
//
//  Created by Yuriy Gudimov on 29.01.2023.
//

import UIKit
import Combine

struct UIControlPublisher<Control: UIControl>: Publisher {
    typealias Output = Control
    typealias Failure = Never
    
    let control: Control
    let event: UIControl.Event
    
    init(control: Control, event: UIControl.Event) {
        self.control = control
        self.event = event
    }
    
    func receive<S>(subscriber: S) where S : Subscriber, Never == S.Failure, Control == S.Input {
        let subscription = Subscription(subscriber: subscriber, control: control, event: event)
        subscriber.receive(subscription: subscription)
    }
}

extension UIControlPublisher {
    final class Subscription<S: Subscriber>: Combine.Subscription where S.Input == Control, S.Failure == Failure {
        
        private var subscriber: S?
        private let control: Control
        private var demand: Subscribers.Demand?
        
        init(subscriber: S, control: Control, event: UIControl.Event) {
            self.subscriber = subscriber
            self .control = control
            control.addTarget(self, action: #selector(handleEvent), for: event)
        }
        
        @objc private func handleEvent() {
            guard let subscriber = subscriber, let demand = demand, demand > 0 else { return }
            let newDemand = subscriber.receive(control)
            self.demand = demand + newDemand
            
        }
        
        func request(_ demand: Subscribers.Demand) {
            self.demand = demand
        }
        
        func cancel() {
            subscriber = nil
        }

    }
}
