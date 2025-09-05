
// import UIKit
// internal import Flutter
// internal import FlutterPluginRegistrant
//madhan
// // ===========================
// // INTERNAL: Flutter engine manager
// // ===========================
// internal final class InternalFlutterEngine {
//     static let shared = InternalFlutterEngine()

//     private(set) var flutterEngine: FlutterEngine?
//     private(set) var flutterViewController: UIViewController?
//     private var methodChannel: FlutterMethodChannel?
//     private var engineStarted = false

//     private init() {}

//     private let networkMonitor = NetworkMonitor.shared

//     // Start the Flutter engine
//     internal func startEngineIfNeeded() {
//         guard !engineStarted else { return }

//         let engine = FlutterEngine(name: "fastag_engine")
//         engine.run()
//         GeneratedPluginRegistrant.register(with: engine)
//         NetworkMonitor.shared.startMonitoring()
//         flutterEngine = engine
//         methodChannel = FlutterMethodChannel(name: "com.tonetag.fastag/data", binaryMessenger: engine.binaryMessenger)

//         methodChannel?.setMethodCallHandler { [weak self] (call, result) in
//             switch call.method {
//             case "checkInternet":
//                 let isConnected = self?.networkMonitor.isConnected ?? false
//                 result(isConnected)
//             default:
//                 result(FlutterMethodNotImplemented)
//             }
//         }

//         // Prepare FlutterViewController internally
//         let flutterVC = FlutterViewController(engine: engine, nibName: nil, bundle: nil)
//         flutterVC.modalPresentationStyle = .fullScreen
//         flutterViewController = flutterVC

//         engineStarted = true
//     }

//     internal func stopEngine() {
//         flutterEngine?.destroyContext()
//         flutterEngine = nil
//         flutterViewController = nil
//         methodChannel = nil
//         engineStarted = false
//     }

//     internal func sendUserInfo(userId: String?, vrn: String?, vehicleVariant: String?, theme: String?) {
//         startEngineIfNeeded()
//         let payload: [String: Any] = [
//             "user_id": userId ?? "",
//             "vrn": vrn ?? "",
//             "vehicle_variant": vehicleVariant ?? "",
//             "theme_type": theme ?? ""
//         ]
//         methodChannel?.invokeMethod("sendInfo", arguments: payload)
//     }
// }

// // ===========================
// // PUBLIC API: Wrapper SDK
// // ===========================
// public final class FastagSdk {

//     /// Open Flutter Fastag screen
//     public static func openFastag(
//         from rootViewController: UIViewController,
//         userId: String,
//         vrn: String,
//         vehicleVariant: String,
//         theme: String,
//         vin:String
//     ) {
//         let engine = InternalFlutterEngine.shared
//         engine.startEngineIfNeeded()
//         engine.sendUserInfo(userId: userId, vrn: vrn, vehicleVariant: vehicleVariant, theme: theme)

//         guard let flutterVC = engine.flutterViewController else {
//             return
//         }
//         rootViewController.present(flutterVC, animated: true)
//     }


// }
