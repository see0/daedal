module Daedal
  module Attributes
    """Custom coercer for the type attribute"""
    class ScoreMode < Virtus::Attribute
      ALLOWED_SCORE_MODES = [:avg, :total, :max, :none, :multiply, :sum, :first, :max, :min]
      def coerce(value)
        unless value.nil?
          value = value.to_sym
          unless ALLOWED_SCORE_MODES.include? value
            raise Virtus::CoercionError.new(value, 'Daedal::Attributes::ScoreMode')
          end
        end
        value
      end
    end
  end
end