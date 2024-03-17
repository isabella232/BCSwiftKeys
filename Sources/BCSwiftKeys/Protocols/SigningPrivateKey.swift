import Foundation

/// A key that affords creation of a signature that may be verified by the public
/// key.
public protocol SigningPrivateKey: SigningPublicKey {
    /// The type of parameters used to sign a message with this key.
    associatedtype SigningParameters

    /// Returns a signature of `message` that may be verified with this key's
    /// public key.
    ///
    /// Throws if the key does not have the `.sign` permission.
    func sign(message: Data, with parameters: SigningParameters) throws -> SignatureType
}

extension SigningPrivateKey where SigningParameters == Void {
    public func sign(message: Data) throws -> SignatureType {
        return try sign(message: message, with: ())
    }
}
