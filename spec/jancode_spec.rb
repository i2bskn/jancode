require "spec_helper"

describe Jancode do
  describe ".#create" do
    context "with gtin13" do
      let(:jancode) {Jancode.create("456995111617")}

      it "create GTIN13 object" do
        expect(jancode.is_a? Jancode::GTIN13).to be_true
      end

      it "create GTIN13 code" do
        expect(jancode.create).to eq("4569951116179")
      end
    end

    context "with gtin8" do
      let(:jancode) {Jancode.create("4912345")}

      it "create GTIN8 object" do
        expect(jancode.is_a? Jancode::GTIN8).to be_true
      end

      it "create GTIN8 code" do
        expect(jancode.create).to eq("49123456")
      end
    end

    context "with invalid params" do
      it "should generate exception" do
        expect {
          Jancode.create("0123456789")
          }.to raise_error
      end
    end
  end

  describe ".#verification?" do
    context "with gtin13" do
      it "returns true if valid jancode" do
        expect(Jancode.verification? "4569951116179").to be_true
      end

      it "returns false if invalid jancode" do
        expect(Jancode.verification? "4569951116170").to be_false
      end
    end

    context "with gtin8" do
      it "returns true if valid jancode" do
        expect(Jancode.verification? "49123456").to be_true
      end

      it "returns false if invalid jancode" do
        expect(Jancode.verification? "49123457").to be_false
      end
    end

    context "with invalid params" do
      it "should generate exception" do
        expect {
          Jancode.verification? "0123456789"
          }.to raise_error
      end
    end
  end
end