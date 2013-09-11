module Jancode
  class GTIN13 < GTIN
    def validation
      raise "Is not 12 characters Item Code and GS1 Company Prefix to suit" if code_array.size != 12
    end
  end
end