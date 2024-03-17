import Foundation

/// A private key that affords producing a shared secret with another public key.
public protocol AgreementPrivateKey: PrivateKey {
    associatedtype AgreementPublicKeyType: AgreementPublicKey
    associatedtype SharedSecret: SymmetricKey
    
    /// Computes a shared secret with the given public key.
    ///
    /// - Throws `KeyError.permissionViolation` if the key does not have the `.agreement` permission.
    func computeSharedSecret(with publicKey: AgreementPublicKeyType) throws -> SharedSecret
}
