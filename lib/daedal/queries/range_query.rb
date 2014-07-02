module Daedal
  module Queries
    """Class for the basic range query"""
    class RangeQuery < Query

      # required attributes
      attribute :field, Daedal::Attributes::Field

      # non required attributes
      attribute :gte,   Daedal::Attributes::QueryValue, required: false
      attribute :lte,   Daedal::Attributes::QueryValue, required: false
      attribute :gt,    Daedal::Attributes::QueryValue, required: false
      attribute :lt,    Daedal::Attributes::QueryValue, required: false

      attribute :boost, Daedal::Attributes::Boost, required: false


      def initialize(options={})
        super options
        unless !gte.nil? or !gt.nil? or !lt.nil? or !lte.nil?
          raise "Must give at least one of gte, gt, lt, or lte"
        end
      end

      def to_hash
        result = {range: {field => {gte: gte, lte: lte, lt: lt, gt: gt}.select {|k,v| !v.nil?}}}
        result[:range][field][:boost] = boost if boost
        result
      end
    end
  end
end