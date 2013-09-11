module Jancode
  class GTIN13 < GTIN
    def validation
      valid_company_prefix @company_prefix
      valid_item_code @item_code
      raise "Is not 12 characters Item Code and GS1 Company Prefix to suit" if code_array.size != 12
    end

    private
    def valid_company_prefix(company_prefix)
      raise "GS1 Company Prefix is not String" unless company_prefix.is_a? String
      raise "GS1 Company Prefix is not 7 or 9 characters" if company_prefix.size != 7 && company_prefix.size != 9
    end

    def valid_item_code(item_code)
      raise "Item Code is not String" unless item_code.is_a? String
      raise "Item Code is not 5 or 3 characters" if item_code.size != 3 && item_code.size != 5
    end
  end
end