def caesar_cipher(str, encrypt_key)
  encrypted_str = ""

  str.each_char do |char|
    unless char == " "
      ascii_code = char.ord - encrypt_key
      
      if char.ord >= 97 && char.ord <= 122 
        while ascii_code < 97 do
          ascii_code = 123 - (97 - ascii_code)
        end

        while ascii_code > 122
          ascii_code = 96 + (ascii_code - 122)
        end
      elsif char.ord >= 65 && char.ord <= 90
        while ascii_code < 65 do
          ascii_code = 91 - (65 - ascii_code)
        end

        while ascii_code > 90
          ascii_code = 64 + (ascii_code - 90)
        end
      end

      encrypted_str += ascii_code.chr
    else
      encrypted_str += char
    end
  end

  encrypted_str
end

str = gets.chomp
encrypt_key = gets.chomp.to_i

puts caesar_cipher(str, encrypt_key)