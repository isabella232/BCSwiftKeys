import Foundation

/// A key that affords verification of a signature created by the private key.
public protocol SigningPublicKey: PublicKey {
    associatedtype SignatureType: Signature

    /// Returns `true` if the signature is made with this key's private key and is valid
    /// for `message`, false otherwise.
    ///
    /// Throws if the key does not have the `.sign` permission.
    func verify(message: Data, signature: SignatureType) throws -> Bool
}
