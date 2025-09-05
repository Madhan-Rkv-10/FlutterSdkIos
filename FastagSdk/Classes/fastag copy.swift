
import UIKit
import Flutter
import FlutterPluginRegistrant

internal final class InternalFlutterEngine {
   static let shared = InternalFlutterEngine()

   private(set) var flutterEngine: FlutterEngine?
   private(set) var flutterViewController: UIViewController?
   private var engineStarted = false

   private init() {}

   private let networkMonitor = NetworkMonitor.shared

   // Start the Flutter engine
   internal func startEngineIfNeeded() {
       guard !engineStarted else { return }

       let engine = FlutterEngine(name: "fastag_engine")
       engine.run()
       GeneratedPluginRegistrant.register(with: engine)
       NetworkMonitor.shared.startMonitoring()
       flutterEngine = engine


       // Prepare FlutterViewController internally
       let flutterVC = FlutterViewController(engine: engine, nibName: nil, bundle: nil)
       flutterVC.modalPresentationStyle = .fullScreen
       flutterViewController = flutterVC

       engineStarted = true
   }

}


public final class DemoApp {

   public static func openSdk(
       from rootViewController: UIViewController,

   ) {
       let engine = InternalFlutterEngine.shared
       engine.startEngineIfNeeded()

       guard let flutterVC = engine.flutterViewController else {
           return
       }
       rootViewController.present(flutterVC, animated: true)
   }


}
