require "minitest/autorun"
require "diffie-hellman"

# much of the assertions are compared by string. this is because hash comparisons don't care about order - string comparisons do
class TestDeepSort < MiniTest::Unit::TestCase

  def test_p
    p = DiffieHellman::generate_p
    assert(p.to_i.to_s(2).size >= 500, "length of p is #{p.to_s(2).size} bits which isn't greater than 500 bits")
  end

end
