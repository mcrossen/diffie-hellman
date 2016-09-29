require "openssl"

module ModularExponent
  def modexp(exponent, mod)
    self.to_bn.mod_exp(exponent, mod)
  end
end
Fixnum.send(:include, ModularExponent)
Bignum.send(:include, ModularExponent)
