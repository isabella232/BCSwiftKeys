import Foundation

/// A public asymmetric key.
public protocol PublicKey: AsymmetricKey { }

extension PublicKey {
    static public var type: AsymmetricKeyType {
        .public
    }
}
