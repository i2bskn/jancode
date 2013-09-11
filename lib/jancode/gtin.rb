module Jancode
  class GTIN
    attr_accessor :company_prefix, :item_code

    def initialize(company_prefix = nil, item_code = nil)
      @company_prefix = company_prefix
      @item_code = item_code
    end

    def create
      [@company_prefix, @item_code, check_digit].join
    end
  end
end
