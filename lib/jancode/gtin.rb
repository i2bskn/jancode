module Jancode
  class GTIN
    attr_accessor :company_prefix, :item_code

    def initialize(company_prefix = nil, item_code = nil)
      @company_prefix = company_prefix
      @item_code = item_code
    end

    def check_digit
      validation
      val = ((sum_even_numbers * 3) + sum_odd_numbers).to_s[-1].to_i
      val == 0 ? 0 : 10 - val
    end

    def create
      [@company_prefix, @item_code, check_digit].join
    end

    private
    def sum_even_numbers
      code = code_array.reverse
      (0..(code.size - 1)).step(2).inject(0){|i,n| i += code[n].to_i}
    end

    def sum_odd_numbers
      code = code_array.reverse
      (1..(code.size - 1)).step(2).inject(0){|i,n| i += code[n].to_i}
    end

    def code_array
      [@company_prefix, @item_code].join.chars
    end
  end
end
