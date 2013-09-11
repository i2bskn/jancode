require "spec_helper"

describe Jancode::GTIN8 do
  let(:jancode) {Jancode::GTIN8.new("491234", "5")}

  it "create GTIN8 code" do
    expect(jancode.create).to eq("49123456")
  end

  it "should generate exception if not 7 characters" do
    jancode.company_prefix = "491"
    expect{
      jancode.create
    }.to raise_error
  end
end