#include "library.h"

int main(){
    std::string path_to_notcrypt = "/Users/danast/Desktop/encryption/notcrypt.txt";
    std::string path_to_willBeEncr = "/Users/danast/Desktop/encryption/notcrypt.txt_encrypted";
    //std::string path_to_decrypt = "/Users/danast/Desktop/encryption/decrypt.txt";

    //для простоты, ключ и IV будут одинаковыми
    const CryptoPP::byte* IV = EncryptionLib::generate_IV();
    const CryptoPP::byte* KEY = EncryptionLib::generate_IV();

    std::cout << "Сгенерированный IV: ";
    for (size_t i = 0; i < CryptoPP::AES::BLOCKSIZE; ++i) {
        std::cout << std::hex << static_cast<int>(IV[i]);
    }
    std::cout << std::endl;
    std::cout << "Сгенерированный KEY: ";
    for (size_t i = 0; i < CryptoPP::AES::BLOCKSIZE; ++i) {
        std::cout << std::hex << static_cast<int>(KEY[i]);
    }
    std::cout << std::endl;

    EncryptionLib::encrypt_file(path_to_notcrypt, KEY, IV);

    EncryptionLib::decrypt_file(path_to_willBeEncr, KEY, IV);
    return 0;
}