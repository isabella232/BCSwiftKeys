import Foundation

/// A public key that affords encryption to the private key.
public protocol EncryptionPublicKey: PublicKey, EncryptionKey {
}
