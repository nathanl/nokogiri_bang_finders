require "nokogiri_bang_finders/version"

module Nokogiri
  module XML
    module BangFinders

      def self.context_length
        @context_length ||= 200
      end

      def self.context_length=(val)
        @context_length = if val.to_s == "all"
                            Float::INFINITY
                          else
                            val.to_i
                          end
      end

      def at!(*args)
        node = at(*args);       raise NotFound.new(args, self) if node.nil?; node
      end

      def at_xpath!(*args)
        node = at_xpath(*args); raise NotFound.new(args, self) if node.nil?; node
      end

      def at_css!(*args)
        node = at_css(*args);   raise NotFound.new(args, self) if node.nil?; node
      end

    end

    class NotFound < StandardError
      attr_reader :message
      def initialize(needle, haystack)
        @message = "#{needle} in \n#{snippet(haystack)}\n"
      end
      def snippet(haystack)
        snippet = haystack.to_s
        snippet.length <= context_length ? snippet : "#{snippet[0..(context_length - 1)]}...\n"
      end

      def context_length
        Nokogiri::XML::BangFinders.context_length
      end
    end
  end
end

Nokogiri::XML::Node.send(:include, Nokogiri::XML::BangFinders)
Nokogiri::XML::NodeSet.send(:include, Nokogiri::XML::BangFinders)
