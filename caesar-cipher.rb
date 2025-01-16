def encrypt(str, encrypt_key)
  encrypted_str = ""

  str.each_char do |char|
      ascii_code = char.ord + encrypt_key
      
      if char.ord.between?(97, 122)

        while ascii_code < 97 do
          ascii_code = 123 - (97 - ascii_code)
        end

        while ascii_code > 122
          ascii_code = 96 + (ascii_code - 122)
        end

      elsif char.ord.between?(65, 90)

        while ascii_code < 65 do
          ascii_code = 91 - (65 - ascii_code)
        end

        while ascii_code > 90
          ascii_code = 64 + (ascii_code - 90)
        end

      else
        encrypted_str += char
      end

      if ascii_code.between?(97,122) || ascii_code.between?(65,90)
        encrypted_str += ascii_code.chr
      end
  end

  encrypted_str
end

def caesar_cipher
  str = ""
  encrypt_key = 0
  
  loop do
    puts "Please enter a text to encrypt: "
    str = gets.chomp
    puts "Please enter a key(number) to encrypt your text:"
    encrypt_key = gets.chomp.to_i

    unless encrypt_key == 0
      break;
    end

    puts "Please enter a valid key(number)."
  end

  puts encrypt(str, encrypt_key)
end

caesar_cipher

