import Foundation

public protocol EncryptionKey: Key {
    associatedtype EncryptionParameters
    associatedtype EncryptedMessageType

    /// Performs encryption on `message` using this key.
    ///
    /// - Throws `KeyError.permissionViolation` if the key does not have the `.encrypt` permission.
    func encrypt(plaintext: Data, with parameters: EncryptionParameters) throws -> EncryptedMessageType
}

extension EncryptionKey where EncryptionParameters == Void {
    /// Convenience encryption method when parameters are not required.
    public func encrypt(plaintext: Data) throws -> EncryptedMessageType {
        return try encrypt(plaintext: plaintext, with: ())
    }
}
