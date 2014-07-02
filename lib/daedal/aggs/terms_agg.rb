module Daedal
  module Aggs
    "" "Class for the terms aggregation" ""
    class TermsAgg < Agg
      attribute :name, String

      #either one must exist
      attribute :field, Daedal::Attributes::Field, required: false
      attribute :script, String, required: false

      #options
      attribute :min_doc_count, Integer, required: false
      attribute :order, Hash[String => String], required: false

      attribute :include, String, required: false
      attribute :include_flags, Daedal::Attributes::PatternFlag, required: false

      attribute :exclude, String, required: false
      attribute :exclude_flags, Daedal::Attributes::PatternFlag, required: false


      def initialize(options={})
        super options

        if field.nil? && script.nil?
          raise "Must give a field or a script"
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