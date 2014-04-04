require "nokogiri_bang_finders/version"

module Nokogiri
  module XML
    module BangFinders
      def at!(*args)
        at(*args).tap       { |node| raise NotFound.new(args, self) if node.nil? }
      end

      def at_xpath!(*args)
        at_xpath(*args).tap { |node| raise NotFound.new(args, self) if node.nil? }
      end

      def at_css!(*args)
        at_css(*args).tap   { |node| raise NotFound.new(args, self) if node.nil? }
      end

    end

    class NotFound < StandardError
      attr_reader :message
      def initialize(needle, haystack)
        @message = "#{needle} in \n#{snippet(haystack)}"
      end
      def snippet(haystack)
        haystack.to_s.tap {|s| s.length > 200 ? "#{s[0...200]}..." : s }
      end
    end
  end
end

Nokogiri::XML::Node.send(:include, Nokogiri::XML::BangFinders)
Nokogiri::XML::NodeSet.send(:include, Nokogiri::XML::BangFinders)
