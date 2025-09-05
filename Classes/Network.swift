
// //
// //  network.swift
// //  fastagsdk
// //
// //  Created by Madhan on 29/08/25.
// //

// import Foundation
// import Network

// internal final class NetworkMonitor {
//     public static let shared = NetworkMonitor()
//     private let monitor: NWPathMonitor
//     private let queue = DispatchQueue(label: "NetworkMonitor")
//     public private(set) var isConnected: Bool = false
    
//     private init() {
//         monitor = NWPathMonitor()
//     }
    
//     public func startMonitoring() {
//         monitor.pathUpdateHandler = { [weak self] path in
//             self?.isConnected = path.status == .satisfied
//             // You can also add more detailed logic here for connection types
//         }
//         monitor.start(queue: queue)
//     }
    
//     public func stopMonitoring() {
//         monitor.cancel()
//     }
// }
