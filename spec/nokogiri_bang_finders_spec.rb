require 'spec_helper'

describe Nokogiri::XML::BangFinders do

  let(:xml_doc) {
    Nokogiri::XML("<root><aliens><alien><name>Alf</name></alien></aliens></root>")
  }
  let(:aliens_node) { xml_doc.at('aliens') }

  describe "#at!" do

    it "calls #at" do
      expect(xml_doc).to receive('at').with('aliens').and_call_original
      xml_doc.at!('aliens')
    end

    describe "when #at returns something" do

      it "returns it" do
        expect(xml_doc.at!('aliens')).to eq(aliens_node)
      end

    end

    describe "when #at returns nil" do

      it "raises an exception" do
        expect{xml_doc.at!('robots')}.to raise_error(Nokogiri::XML::NotFound)
      end

    end

  end

  describe "#at_css!" do

    it "calls #at" do
      expect(xml_doc).to receive('at_css').with('aliens').and_call_original
      xml_doc.at_css!('aliens')
    end

    describe "when #at_css returns something" do

      it "returns it" do
        expect(xml_doc.at_css!('aliens')).to eq(aliens_node)
      end

    end

    describe "when #at_css returns nil" do

      it "raises an exception" do
        expect{xml_doc.at_css!('robots')}.to raise_error(Nokogiri::XML::NotFound)
      end

    end

  end

  describe "#at_xpath!" do

    it "calls #at" do
      expect(xml_doc).to receive('at_xpath').with('//aliens').and_call_original
      xml_doc.at_xpath!('//aliens')
    end

    describe "when #at_xpath returns something" do

      it "returns it" do
        expect(xml_doc.at_xpath!('//aliens')).to eq(aliens_node)
      end

    end

    describe "when #at_xpath returns nil" do

      it "raises an exception" do
        expect{xml_doc.at_xpath!('//robots')}.to raise_error(Nokogiri::XML::NotFound)
      end

    end

  end

end
