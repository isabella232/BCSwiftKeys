import Foundation

public protocol RSATraits {
    static var algorithm: KeyAlgorithm { get }
    static var capabilities: KeyCapabilities { get }
}

public enum RSA2048Traits: RSATraits {
    public static var algorithm: KeyAlgorithm = .rsa2048
    public static var capabilities: KeyCapabilities = [.encrypt, .sign, .wrap, .authenticate]
}

public enum RSA4096Traits: RSATraits {
    public static var algorithm: KeyAlgorithm = .rsa4096
    public static var capabilities: KeyCapabilities = [.encrypt, .sign, .wrap, .authenticate]
}
