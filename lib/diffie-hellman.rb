
require "openssl"

KEY_SIZE = 500
G = 5

class DiffieHellman
  def self.generate_p
    dh.params["p"]
  end

  def self.pub_key
    dh.pub_key
  end

  def self.compute_key(other)
    other = OpenSSL::BN.new(other) if other.is_a? String
    dh.compute_key(other).bytes.inject {|a, b| (a << 8) + b}
  end

  def self.dh
    @@dh ||= OpenSSL::PKey::DH.new(KEY_SIZE, G)
  end

  def self.reset
    @@dh = nil
  end

end
