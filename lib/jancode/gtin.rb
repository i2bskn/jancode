module Jancode
  class GTIN
    attr_accessor :company_prefix, :item_code

    def initialize(company_prefix = nil, item_code = nil)
      @company_prefix = company_prefix
      @item_code = item_code
    end

    def check_digit
      validation
      val = ((sum_numbers(:even) * 3) + sum_numbers(:odd)).to_s[-1].to_i
      val == 0 ? 0 : 10 - val
    end

    def create
      [@company_prefix, @item_code, check_digit].join
    end

    private
    def sum_numbers(type)
      case type
      when :even then start = 0
      when :odd then start = 1
      else
        raise "Unknown type: #{type}"
      end

      code = code_array.reverse
      (start..(code.size - 1)).step(2).inject(0){|i,n| i += code[n].to_i}
    end

    def code_array
      # [@company_prefix, @item_code].join.chars
      [@company_prefix, @item_code].join.each_char.to_a
    end
  end
end
