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

      it "raises an exception describing the failed search" do
        e = exception_from { xml_doc.at!("robots") }
        expect(e).to be_a(Nokogiri::XML::NotFound)
        expect(e.message).to match(/robots/)
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

      it "raises an exception describing the failed search" do
        e = exception_from { xml_doc.at_css!("robots") }
        expect(e).to be_a(Nokogiri::XML::NotFound)
        expect(e.message).to match(/robots/)
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

      it "raises an exception describing the failed search" do
        e = exception_from { xml_doc.at_xpath!("//robots") }
        expect(e).to be_a(Nokogiri::XML::NotFound)
        expect(e.message).to match(/\/\/robots/)
      end

    end

  end

  describe "providing context with an exception" do

    let(:xml_doc) {
      body = "<root><numbers>"
      1_000.times do |i|
        body << "<number>#{i}</number>"
      end
      body << "</numbers></root>"
      Nokogiri::XML(body)
    }

    it "does not include the whole document" do
      e = exception_from { xml_doc.at_css!("robots") }
      expect(e.message).not_to include(xml_doc.to_s)
    end


    it "includes the first 200 characters of the document by default" do
      e = exception_from { xml_doc.at_css!("robots") }
      expect(e.message    ).to include(xml_doc.to_s[0..199])
      expect(e.message).not_to include(xml_doc.to_s[0..200])
    end

  end

end
