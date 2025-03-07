class CaesarCipher
  def initialize(text, shift)
    @text = text
    @shift = shift
    @encrypted_text = ""
  end

  def encrypt(text = @text, shift = @shift)
    text.each_char do |char|
      ascii_code = char.ord + shift

      if char.ord.between?(97, 122)
        ascii_code = encrypt_lowercase(ascii_code)
      elsif char.ord.between?(65, 90)
        ascii_code = encrypt_uppercase(ascii_code)
      else
        @encrypted_text += char
      end

      @encrypted_text += ascii_code.chr if ascii_code.between?(97, 122) || ascii_code.between?(65, 90)
    end
    @encrypted_text
  end

  def encrypt_lowercase(ascii_code)
    ascii_code = 123 - (97 - ascii_code) while ascii_code < 97
    ascii_code = 96 + (ascii_code - 122) while ascii_code > 122
    ascii_code
  end

  def encrypt_uppercase(ascii_code)
    ascii_code = 91 - (65 - ascii_code) while ascii_code < 65
    ascii_code = 64 + (ascii_code - 90) while ascii_code > 90
    ascii_code
  end

  def display_encrypted_text
    puts "The encrypted text is: #{@encrypted_text}"
  end
end

# caesar = CaesarCipher.new("Hello", 5)
# caesar.encrypt
# caesar.display_encrypted_text
