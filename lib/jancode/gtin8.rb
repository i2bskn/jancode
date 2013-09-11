module Jancode
  class GTIN8 < GTIN
    def validation
      raise "Is not 7 characters Item Code and GS1 Company Prefix to suit" if code_array.size != 7
    end
  end
end