require "spec_helper"

describe Jancode::GTIN do
  let(:gtin13) {Jancode::GTIN.new("456995111", "617")}
  let(:gtin8) {Jancode::GTIN8.new("491234", "5")}

  describe "#initialize" do
    context "default" do
      let(:gtin) {Jancode::GTIN.new}

      it "company_prefix should be a nil" do
        expect(gtin.company_prefix).to be_nil
      end

      it "item_code should be a nil" do
        expect(gtin.item_code).to be_nil
      end
    end

    context "with arguments" do
      it "company_prefix should be a specified value" do
        expect(gtin13.company_prefix).to eq("456995111")
        expect(gtin8.company_prefix).to eq("491234")
      end

      it "item_code should be a nil" do
        expect(gtin13.item_code).to eq("617")
        expect(gtin8.item_code).to eq("5")
      end
    end
  end

  describe "#check_digit" do
    before {Jancode::GTIN.any_instance.stub(:validation)}

    it "returns check digit" do
      expect(gtin13.check_digit).to eq(9)
      expect(gtin8.check_digit).to eq(6)
    end

    it "should call #validation" do
      Jancode::GTIN.any_instance.should_receive(:validation)
      gtin13.check_digit
    end
  end

  describe "#create" do
    before {Jancode::GTIN.any_instance.stub(:validation)}

    it "returns jancode" do
      expect(gtin13.create).to eq("4569951116179")
      expect(gtin8.create).to eq("49123456")
    end
  end

  describe "#sum_numbers" do
    it "returns total even number" do
      expect(gtin13.send(:sum_numbers,:even)).to eq(33)
      expect(gtin8.send(:sum_numbers,:even)).to eq(13)
    end

    it "returns total odd number" do
      expect(gtin13.send(:sum_numbers, :odd)).to eq(22)
      expect(gtin8.send(:sum_numbers, :odd)).to eq(15)
    end

    it "should generate exception if unknown type" do
      expect {
        gtin13.send(:sum_numbers, :unknown)
      }.to raise_error
    end

    it "should call #code_array" do
      Jancode::GTIN.any_instance.should_receive(:code_array).and_return(["4", "9", "1", "2", "3", "4", "5"])
      gtin8.send(:sum_numbers, :even)
    end
  end

  describe "#code_array" do
    it "returns character array" do
      expected1 = ["4", "5", "6", "9", "9", "5", "1", "1", "1", "6", "1", "7"]
      expected2 = ["4", "9", "1", "2", "3", "4", "5"]
      expect(gtin13.send(:code_array)).to eq(expected1)
      expect(gtin8.send(:code_array)).to eq(expected2) 
    end
  end
end