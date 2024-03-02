#include "library.h"

const CryptoPP::byte *EncryptionLib::generate_IV() {
    // Размер IV для AES в режиме CBC
    const size_t IV_SIZE = CryptoPP::AES::BLOCKSIZE;

    // Создание объекта CSPRNG (криптографически стойкого генератора псевдослучайных чисел)
    CryptoPP::AutoSeededRandomPool prng;

    // Статический буфер для хранения сгенерированного IV
    //будет сохранять свое значение между вызовами функции, это самое важное
    static CryptoPP::byte iv[IV_SIZE];

    // Генерация случайного IV
    prng.GenerateBlock(iv, IV_SIZE);

    //указатель на начало массива
    return iv;
}

void EncryptionLib::encrypt_file(const std::string& input_file, const CryptoPP::byte* key, const CryptoPP::byte* iv) {
    std::ifstream f_in(input_file, std::ios::binary);

    if (!f_in) {
        std::cerr << "Something wrong opening with file" << std::endl;
        // завершаем функцию в случае ошибки открытия
        return;
    }

    // Находим позицию последней точки (расширения файла)
    size_t dot_pos = input_file.find_last_of(".");

    // Проверяем, что точка найдена и не является первым символом или последним символом в строке
    if (dot_pos != std::string::npos && dot_pos > 0 && dot_pos < input_file.length() - 1) {
        // Формируем имя зашифрованного файла с добавлением "_encrypted" перед расширением
        std::string name_output_file = input_file.substr(0, dot_pos) + "_encrypted" + input_file.substr(dot_pos);

        std::ofstream f_out(name_output_file, std::ios::binary);

        if (!f_out) {
            std::cerr << "Something wrong opening with file" << std::endl;
            // завершаем функцию в случае ошибки открытия
            return;
        }

        try {
            CryptoPP::CBC_Mode<CryptoPP::AES>::Encryption encryption;
            encryption.SetKeyWithIV(key, CryptoPP::AES::DEFAULT_KEYLENGTH, iv);

            auto *ptr_sink = new CryptoPP::FileSink(f_out);
            auto *ptr_filter = new CryptoPP::StreamTransformationFilter(encryption, ptr_sink);
            CryptoPP::FileSource fileSource(f_in, true, ptr_filter);
        }
        catch (const CryptoPP::Exception& ex) { // Exception тип исключения из библиотеки Crypto++
            std::cerr << ex.what() << std::endl;
            return;
        }
    }
    else {
        std::cerr << "Invalid file name format" << std::endl;
        return;
    }
}

void EncryptionLib::decrypt_file(const std::string& input_file, const CryptoPP::byte* key, const CryptoPP::byte* iv){
    std::ifstream f_in(input_file, std::ios::binary);

    if(!f_in){
        std::cerr << "Something wrong opening with file" << std::endl;
        //завершаем ф-цию в случае ошибки открытия
        return;
    }

    // Предполагаем, что имя зашифрованного файла имеет "_encrypted" в конце,
    // чтобы создать имя расшифрованного файла.
    std::string output_file = input_file;
    size_t pos = output_file.find_last_of(".");
    if (pos != std::string::npos) {
        output_file = output_file.substr(0, pos); // удаляем расширение файла
    }
    output_file += "_decrypted.jpg";

    std::ofstream f_out(output_file, std::ios::binary);

    if(!f_out){
        std::cerr << "Something wrong opening with file" << std::endl;
        //завершаем ф-цию в случае ошибки открытия
        return;
    }

    try{
        CryptoPP::CBC_Mode<CryptoPP::AES>::Decryption decryption;
        decryption.SetKeyWithIV(key, CryptoPP::AES::DEFAULT_KEYLENGTH, iv);

        /*цепочка фильтров для обработки данных (шифрование файла) (освобождение памяти должно проходить в таком порядке 1)delete ptr_filter; 2)delete ptr_sink;)*/

        // Цепочка фильтров для обработки данных (расшифрование файла)
        auto* ptr_sink = new CryptoPP::FileSink(f_out);
        auto* ptr_filter = new CryptoPP::StreamTransformationFilter(decryption, ptr_sink);
        CryptoPP::FileSource fileSource(f_in, true, ptr_filter);

    }catch (const CryptoPP::Exception& ex){ // Exception тип исключения из библиотеки Crypto++
        std::cerr << ex.what() << std::endl;
        return;
    }
}
