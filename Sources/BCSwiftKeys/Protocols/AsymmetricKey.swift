import Foundation

/// The type of an asymmetric key (private or public).
public enum AsymmetricKeyType {
    case `private`
    case `public`
}

public protocol AsymmetricKey: Key {
    /// Whether the key is private or public.
    static var type: AsymmetricKeyType { get }
}
