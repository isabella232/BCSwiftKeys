import Foundation

public struct KeyCapabilities: OptionSet, Hashable {
    public let rawValue: Int

    /// Private keys of this type afford deriving a characteristic public key.
    public static let publicKey = KeyCapabilities(rawValue: 1 << 0)

    /// Private and symmetric keys of this type afford encryption.
    /// Public keys of this type afford decryption.
    public static let encrypt = KeyCapabilities(rawValue: 1 << 1)

    /// Private keys of this type afford signing.
    /// Public keys of this type afford verification.
    public static let sign = KeyCapabilities(rawValue: 1 << 2)

    /// Private keys of this type afford producing a shared secret with another
    /// public key.
    public static let agreement = KeyCapabilities(rawValue: 1 << 3)

    /// Private keys of this type afford deriving a range of other keys.
    public static let derive = KeyCapabilities(rawValue: 1 << 4)

    /// Private keys of this type afford wrapping other keys, typically
    /// symmetric keys for key exchange.
    /// Public keys of this type afford unwrapping other keys.
    public static let wrap = KeyCapabilities(rawValue: 1 << 5)

    /// Public keys of this type afford authenticating an entity.
    public static let authenticate = KeyCapabilities(rawValue: 1 << 6)

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}
