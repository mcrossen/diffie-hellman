require "minitest/autorun"
require "diffie-hellman"
require "openssl"

# used to test if ints are prime or not
module PrimeHelper
  def prime?
    # convert to the openssl bignum and use that method
    OpenSSL::BN.new(self.to_s).prime?
  end
end
Fixnum.send(:include, PrimeHelper)
Bignum.send(:include, PrimeHelper)

# gives the private key a public accessor for the tests
module DHhelper
  def priv_key
    @priv_key
  end
end
DiffieHellman.send(:include, DHhelper)

# unit test for DiffieHellman
class TestDiffieHellman < MiniTest::Test
  def test_p
    dh = DiffieHellman.new
    p = dh.p
    assert(p.to_s(2).size >= 500, "length of p is #{p.to_s(2).size} bits which isn't greater than 500 bits")
    assert(p.prime?, "p must be prime")
    assert(((p-1)/2).prime?, "(p-1)/2 must be prime")
  end

  def test_pubkey
    dh = DiffieHellman.new
    # use different library to compare against for test
    assert_equal(5.to_bn.mod_exp(dh.priv_key, dh.p).to_i, dh.pub_key)
  end

  def test_compute_key
    dh = DiffieHellman.new
    other_priv_key = 1998286638065473057944506344030256054916203227381748916180906390214373930105605405985818224246280726328877245115163209963634633681313092395058312190549
    # use different library to compare against for test
    other_pub_key = 5.to_bn.mod_exp(other_priv_key, dh.p)
    other_secret = dh.pub_key.to_bn.mod_exp(other_priv_key, dh.p).to_i
    secret = dh.compute_key(other_pub_key.to_s)
    assert_equal(other_secret, secret, "secrets do not match")
  end

end
