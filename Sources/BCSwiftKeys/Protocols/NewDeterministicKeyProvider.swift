import Foundation

/// A type that affords deterministically creating new key, typically used for testing.
public protocol NewDeterministicKeyProvider: NewKeyProvider {
    /// Deterministically create a new key using the given random number generator and permissions.
    ///
    /// - Throws `KeyError.permissionViolation` if `permissions` is not a subset of `Self.capabilities`.
    ///
    /// This method is intended for testing only.
    init<T: RandomNumberGenerator>(using rng: inout T, permissions: KeyCapabilities) throws
}
