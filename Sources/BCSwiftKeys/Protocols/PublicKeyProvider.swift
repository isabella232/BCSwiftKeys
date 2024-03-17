import Foundation

public protocol PublicKeyProvider {
    associatedtype PublicKeyType
    
    /// Returns this private key's characteristic public key.
    ///
    /// - Throws `KeyError.permissionViolation` if this key does not have the
    /// `.publicKey` permission.
    var publicKey: PublicKeyType { get throws }
}
