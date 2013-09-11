require "spec_helper"

describe Jancode::GTIN13 do
  let(:jancode) {Jancode::GTIN13.new("456995111", "617")}

  it "create GTIN13 code" do
    expect(jancode.create).to eq("4569951116179")
  end

  it "should generate exception if not 12 characters" do
    jancode.company_prefix = "451"
    expect{
      jancode.create
    }.to raise_error
  end
end