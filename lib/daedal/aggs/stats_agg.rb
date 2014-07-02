module Daedal
  module Aggs
    "" "Class for the stats aggregation" ""
    class StatsAgg < Agg
      attribute :name, String

      # either one must present
      attribute :field, Daedal::Attributes::Field, required: false
      attribute :script, String, required: false

      def initialize(options={})
        super options

        if field.nil? && script.nil?
          raise "Must give a field or a script"
        elsif field && script
          raise "Use either field or script only, but not both"
        end
      end

      def to_hash
        result = {name => {stats: {}}}

        if field
          result[name][:stats] = {field: field}
        else
          result[name][:stats] = {script: script}
        end

        result
      end

    end
  end
end