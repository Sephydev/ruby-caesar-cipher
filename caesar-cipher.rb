def caesar_cipher(str)
  encrypt_key = 4
  encrypted_str = ""

  str.each_char do |char|
    unless char == " "
      ascii_code = char.ord - encrypt_key
      
      if char.ord >= 97 && char.ord <= 122 
        if ascii_code < 97
          ascii_code = 123 - (97 - ascii_code)
        end
      elsif char.ord >= 65 && char.ord <= 90
        if ascii_code < 65
          ascii_code = 91 - (65 - ascii_code)
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

puts caesar_cipher(str)