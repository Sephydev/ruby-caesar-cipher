require_relative "../caesar-cipher"

describe CaesarCipher do
  describe "#encrypt" do
    context "when the text has no punctuation" do
      subject(:caesar_cipher) { described_class.new("Hello", 7) }

      it "encrypt correctly" do
        caesar_cipher.encrypt
        result = caesar_cipher.instance_variable_get(:@encrypted_text)
        expect(result).to eq("Olssv")
      end
    end

    context "when the text has special character" do
      subject(:caesar_cipher) { described_class.new("Hello, World! 123", 7) }

      it "does not encrypt special character" do
        caesar_cipher.encrypt
        result = caesar_cipher.instance_variable_get(:@encrypted_text)
        expect(result).to eq("Olssv, Dvysk! 123")
      end
    end

    context "when the text is only lowercase" do
      subject(:caesar_cipher) { described_class.new("hello, world!", 7) }

      it "encrypt correctly in lowercase" do
        caesar_cipher.encrypt
        result = caesar_cipher.instance_variable_get(:@encrypted_text)
        expect(result).to eq("olssv, dvysk!")
      end
    end

    context "when the text is only uppercase" do
      subject(:caesar_cipher) { described_class.new("HELLO, WORLD!", 7) }

      it "encrypt correctly in uppercase" do
        caesar_cipher.encrypt
        result = caesar_cipher.instance_variable_get(:@encrypted_text)
        expect(result).to eq("OLSSV, DVYSK!")
      end
    end

    context "when the text is only special character" do
      subject(:caesar_cipher) { described_class.new("123 !,-", 7) }
      it "does not encrypt the text" do
        caesar_cipher.encrypt
        result = caesar_cipher.instance_variable_get(:@encrypted_text)
        expect(result).to eq("123 !,-")
      end
    end

    context "when the shift is positive and short" do
      subject(:caesar_cipher) { described_class.new("Hello", 7) }
      it "encrypt correctly" do
        caesar_cipher.encrypt
        result = caesar_cipher.instance_variable_get(:@encrypted_text)
        expect(result).to eq("Olssv")
      end
    end

    context "when the shift is positive and long" do
      subject(:caesar_cipher) { described_class.new("Hello", 700_000) }
      it "encrypt correctly" do
        caesar_cipher.encrypt
        result = caesar_cipher.instance_variable_get(:@encrypted_text)
        expect(result).to eq("Jgnnq")
      end
    end

    context "when the shift is negative and short" do
      subject(:caesar_cipher) { described_class.new("Hello", -7) }
      it "encrypt correctly" do
        caesar_cipher.encrypt
        result = caesar_cipher.instance_variable_get(:@encrypted_text)
        expect(result).to eq("Axeeh")
      end
    end

    context "when the shift is negative and long" do
      subject(:caesar_cipher) { described_class.new("Hello", -700_000) }
      it "encrypt correctly" do
        caesar_cipher.encrypt
        result = caesar_cipher.instance_variable_get(:@encrypted_text)
        expect(result).to eq("Fcjjm")
      end
    end
  end
end
