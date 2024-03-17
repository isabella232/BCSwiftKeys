import Foundation

/// A private asymmetric key.
public protocol PrivateKey: PublicKey { }

extension PrivateKey {
    static public var type: AsymmetricKeyType {
        .private
    }
}
