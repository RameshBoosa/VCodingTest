//
//  Coordinator.swift
//  VCodingTest
//
//  Created by Ramesh Boosa on 3/16/23.
//

import UIKit

/**
 Coordinator - Coordinator protocol can be reused further if app introduces child modules or child coordinators(module specific coordinators)
 */
protocol Coordinator {
    var childrenCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start() // starting point of the app
}


