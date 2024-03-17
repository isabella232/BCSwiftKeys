import Foundation
import WolfBase
import URKit

public protocol EncryptedMessage {
}

/// A secure encrypted message.
///
/// Implemented using the IETF ChaCha20-Poly1305 encryption.
///
/// https://datatracker.ietf.org/doc/html/rfc8439
///
/// To facilitate decoding, it is recommended that the plaintext of an
/// `IETFChaCha20Poly1305Message` be tagged CBOR.
public struct IETFChaCha20Poly1305Message: EncryptedMessage {
    public let ciphertext: Data
    public let aad: Data // Additional authenticated data (AAD) per RFC8439
    public let nonce: Nonce
    public let auth: Auth
    
    public struct Auth: CustomStringConvertible, Equatable, Hashable {
        public let data: Data
        
        public init?(_ data: Data) {
            guard data.count == 16 else {
                return nil
            }
            self.data = data
        }
        
        public init?(_ bytes: [UInt8]) {
            self.init(Data(bytes))
        }
        
        public var bytes: [UInt8] {
            data.bytes
        }
        
        public var description: String {
            data.hex.flanked("auth(", ")")
        }
    }
}

extension IETFChaCha20Poly1305Message: URCodable {
    public static let cborTags = [Tag.encrypted]

    public var untaggedCBOR: CBOR {
        if self.aad.isEmpty {
            return [ciphertext.cbor, nonce.data.cbor, auth.data.cbor]
        } else {
            return [ciphertext.cbor, nonce.data.cbor, auth.data.cbor, aad.cbor]
        }
    }
    
    public init(untaggedCBOR: CBOR) throws {
        let (ciphertext, aad, nonce, auth) = try Self.decode(cbor: untaggedCBOR)
        self = IETFChaCha20Poly1305Message(ciphertext: ciphertext, aad: aad, nonce: nonce, auth: auth)
    }

    public static func decode(cbor: CBOR) throws -> (ciphertext: Data, aad: Data, nonce: Nonce, auth: Auth)
    {
        guard
            case let CBOR.array(elements) = cbor,
            (3...4).contains(elements.count),
            case let CBOR.bytes(ciphertext) = elements[0],
            case let CBOR.bytes(nonceData) = elements[1],
            let nonce = Nonce(nonceData),
            case let CBOR.bytes(authData) = elements[2],
            let auth = Auth(authData)
        else {
            throw CBORError.invalidFormat
        }

        if elements.count == 4 {
            guard
                case let CBOR.bytes(aad) = elements[3],
                !aad.isEmpty
            else {
                throw CBORError.invalidFormat
            }
            return (ciphertext, aad, nonce, auth)
        } else {
            return (ciphertext, Data(), nonce, auth)
        }
    }
}
