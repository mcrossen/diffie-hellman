module ModularExponent
  def modexp(exponent, mod)
    base = nil
    exponent.to_s(2).split(//).reverse.reduce(1) do |product, bit|
      base = base.nil? ? self % mod : (base ** 2) % mod
      bit == "1" ? (product * base) % mod : product
    end
  end
end
Fixnum.send(:include, ModularExponent)
Bignum.send(:include, ModularExponent)
