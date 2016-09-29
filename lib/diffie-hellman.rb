require "openssl/bn"
require "modularexponent"
require "securerandom"

KEY_SIZE = 500
G = 5

class DiffieHellman
  attr_reader :p, :pub_key

  def compute_key(other)
    other = other.to_i if other.is_a? String
    other.modexp(@priv_key, @p)
  end

  def initialize(key_size=KEY_SIZE, generator=G)
    raise "key size must be divisible by 4" if key_size % 4 != 0
    @p = OpenSSL::BN::generate_prime(key_size, true).to_i
    @priv_key = SecureRandom.random_number(2 ** key_size)
    @pub_key = generator.modexp(@priv_key, @p)
  end

end
