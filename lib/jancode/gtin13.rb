module Jancode
  class GTIN13 < GTIN
    def check_digit
      code = [@company_prefix, @item_code].join.chars.map{|n| n.to_i}
      even = (1..(code.size - 1)).step(2).inject(0){|i,n| i += code[n] * 3}
      odd = (0..(code.size - 1)).step(2).inject(0){|i,n| i += code[n]}
      val = (even + odd).to_s[-1].to_i
      val == 0 ? 0 : 10 - val
    end
  end
end