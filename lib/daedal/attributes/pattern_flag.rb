module Daedal
  module Attributes
    """Custom coercer for the term flags attribute"""
    class PatternFlag < Virtus::Attribute
      ALLOWED_TERM_PATTERN_FLAGS = [:CANON_EQ, :CASE_INSENSITIVE, :COMMENTS, :DOTALL, :LITERAL, :MULTILINE, :UNICODE_CASE, :UNICODE_CHARACTER_CLASS, :UNIX_LINES]
      def coerce(value)
        unless value.nil?
          value = value.split('|').map {|v| v.upcase.to_sym }
          if (value - ALLOWED_TERM_PATTERN_FLAGS).any?
            raise Virtus::CoercionError.new(value, 'Daedal::Attributes::TermPatternFlag')
          end
        end
        value
      end
    end
  end
end