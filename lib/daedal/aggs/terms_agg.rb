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

      #include/exclude must present for include/exclude_flags
      attribute :include, String, required: false
      attribute :include_flags, Daedal::Attributes::PatternFlag, required: false

      attribute :exclude, String, required: false
      attribute :exclude_flags, Daedal::Attributes::PatternFlag, required: false

      attribute :size, Integer, required: false


      def initialize(options={})
        super options

        if field.nil? && script.nil?
          raise "Must give a field or a script"
        elsif exclude_flags && exclude.nil?
          raise "Please include exclude field"
        elsif include_flags && include.nil?
          raise "Please include include field"
        end
      end

      def to_hash
        result = {name => { terms: {} }}

        result[name][:terms][:field] = field if field
        result[name][:terms][:script] = script if script
        result[name][:terms][:min_doc_count] = min_doc_count if min_doc_count
        result[name][:terms][:order] = order if order
        result[name][:terms][:include] = include if include
        result[name][:terms][:include][:flags] = include if include_flags
        result[name][:terms][:exclude] = exclude if exclude
        result[name][:terms][:exclude][:flags] = exclude if exclude_flags
        result[name][:terms][:size] = size if size

        result
      end

    end
  end
end