import Foundation

/// An algorithm used to create a key.
///
/// Each case represents not only the general algorithm, but the major parameter set
/// used.
public enum KeyAlgorithm {
    // Symmetric
    case ietf_chacha20_poly1305
    case aes128
    case aes256
    case serpent
    case twofish
    
    // Asymmetric
    case rsa2048
    case rsa4096
    case secp256k1_ecdsa
    case secp256k1_schnorr
    case ecdsa_nistp256
    case ecdsa_nistp384
    case ecdsa_nistp521
    case ed25519
    case ristretto255
    case x25519
    case x448
    case ed448
    
    // Post-Quantum
    case ntru_hrs701
    case ntru_hps2048509
    case ntru_hps2048677
    case ntru_hps4096821
    case kyber512
    case kyber768
    case kyber1024
    case sike_p434
    case sike_p503
    case sike_p610
    case sike_p751
    case dilithium2
    case dilithium3
    case dilithium5
    case falcon512
    case falcon1024
    case pq3
}
