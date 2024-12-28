import Flutter
import UIKit
import NISdk

public class SwiftNgeniusPaymentGatwayPlugin: NSObject, FlutterPlugin {
    private var pendingResult: FlutterResult?
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "ngenius_payment_gatway", binaryMessenger: registrar.messenger())
        let instance = SwiftNgeniusPaymentGatwayPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "getPlatformVersion":
            result("iOS " + UIDevice.current.systemVersion)
        case "initiateCardPayment":
            guard let args = call.arguments as? [String: Any],
                  let gatewayUrl = args["gatewayUrl"] as? String,
                  let amount = args["amount"] as? Double,
                  let currency = args["currency"] as? String,
                  let orderReference = args["orderReference"] as? String else {
                result(FlutterError(code: "INVALID_ARGUMENTS",
                                  message: "Missing required parameters",
                                  details: nil))
                return
            }
            
            pendingResult = result
            
            // Initialize SDK
            let sdk = NISdk.sharedInstance
            
            // Create payment configuration
            let config = NICardPaymentConfig()
            config.amount = NSDecimalNumber(value: amount)
            config.currency = currency
            config.reference = orderReference
            config.gatewayUrl = gatewayUrl
            
            // Show payment view
            if let topViewController = UIApplication.shared.keyWindow?.rootViewController {
                sdk.showCardPaymentView(with: config,
                                      delegate: self,
                                      presentOver: topViewController)
            }
            
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}

// MARK: - NICardPaymentDelegate
extension SwiftNgeniusPaymentGatewayPlugin: NICardPaymentDelegate {
    public func cardPaymentDidComplete(withStatus status: NICardPaymentStatus, error: Error?) {
        var response: [String: Any] = [:]
        
        switch status {
        case .success:
            response["status"] = "success"
        case .failed:
            response["status"] = "failed"
            if let error = error {
                response["error"] = error.localizedDescription
            }
        case .cancelled:
            response["status"] = "cancelled"
        @unknown default:
            response["status"] = "unknown"
        }
        
        pendingResult?(response)
        pendingResult = nil
    }
} 