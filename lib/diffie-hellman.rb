require "openssl/bn"
require "modularexponent"
require "securerandom"

KEY_SIZE = 500 # default size of the prime modulus and the private key
G = 5 # default generator

class DiffieHellman
  attr_reader :p, :pub_key

  def compute_key(other)
    other = other.to_i if other.is_a? String
    other.modexp(@priv_key, @p)
  end

  # create all the starting values
  def initialize(key_size=KEY_SIZE, generator=G)
    raise "key size must be divisible by 4" if key_size % 4 != 0
    # generate a large prime with the openssl library
    @p = OpenSSL::BN::generate_prime(key_size, true).to_i
    # the SecureRandom library uses urandom
    @priv_key = SecureRandom.random_number(2 ** key_size)
    # calculate the public key based off the private key and p
    @pub_key = generator.modexp(@priv_key, @p)
  end

end
