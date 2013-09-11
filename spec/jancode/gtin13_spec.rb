require "spec_helper"

describe Jancode::GTIN13 do
  it "create GTIN13 code" do
    jancode = Jancode::GTIN13.new("456995111", "617")
    expect(jancode.create).to eq("4569951116179")
  end
end