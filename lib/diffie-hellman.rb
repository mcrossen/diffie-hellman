require "openssl"

KEY_SIZE = 500
G = 5

class DiffieHellman
  attr_reader :p, :pub_key

  def compute_key(other)
    other = other.to_i if other.is_a? String
    other.modexp(@priv_key, @p)
  end

  def initialize(key_size=KEY_SIZE, generator=G)
    dh = OpenSSL::PKey::DH.new(key_size, generator)
    @p = dh.params["p"].to_i
    @priv_key = dh.params["priv_key"].to_i
    @pub_key = generator.modexp(@priv_key, @p)
  end

end
