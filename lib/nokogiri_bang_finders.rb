require "nokogiri_bang_finders/version"

module Nokogiri
  module XML
    module BangFinders
      def at!(*args)
        at(*args).tap       { |node| raise NotFound if node.nil? }
      end

      def at_xpath!(*args)
        at_xpath(*args).tap { |node| raise NotFound if node.nil? }
      end

      def at_css!(*args)
        at_css(*args).tap   { |node| raise NotFound if node.nil? }
      end

    end

    NotFound = Class.new(StandardError)
  end
end

Nokogiri::XML::Node.send(:include, Nokogiri::XML::BangFinders)
Nokogiri::XML::NodeSet.send(:include, Nokogiri::XML::BangFinders)
