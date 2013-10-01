require "jancode/version"
require "jancode/gtin"
require "jancode/gtin13"
require "jancode/gtin8"

module Jancode
  class << self
    # without check digit
    def create(code)
      case code.size
      when 12
        company_prefix = code[0..8]
        item_code = code[9..11]
        Jancode::GTIN13.new(company_prefix, item_code)
      when 7
        company_prefix = code[0..5]
        item_code = code[6]
        Jancode::GTIN8.new(company_prefix, item_code)
      else
        raise "Is not 12 or 7 characters"
      end
    end

    def verification?(code)
      case code.size
      when 13
        company_prefix = code[0..8]
        item_code = code[9..11]
        jancode = Jancode::GTIN13.new(company_prefix, item_code)
      when 8
        company_prefix = code[0..5]
        item_code = code[6]
        jancode = Jancode::GTIN8.new(company_prefix, item_code)
      else
        raise "Is not 13 or 8 characters"
      end

      jancode.create == code
    end
  end
end
