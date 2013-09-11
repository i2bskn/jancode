module Jancode
  class GTIN8 < GTIN
    def validation
      valid_company_prefix @company_prefix
      valid_item_code @item_code
      raise "Is not 7 characters Item Code and GS1 Company Prefix to suit" if code_array.size != 7
    end

    private
    def valid_company_prefix(company_prefix)
      raise "GS1 Company Prefix is not String" unless company_prefix.is_a? String
      raise "GS1 Company Prefix is not 6 characters" if company_prefix.size != 6
    end

    def valid_item_code(item_code)
      raise "Item Code is not String" unless item_code.is_a? String
      raise "Item Code is not 1 characters" if item_code.size != 1
    end
  end
end