require 'json'
require 'virtus'

# base query and filter classes needed by the attributes
require 'daedal/queries/query'
require 'daedal/filters/filter'
require 'daedal/aggs/agg'

# attributes
require 'daedal/attributes/operator'
require 'daedal/attributes/match_type'
require 'daedal/attributes/query_array'
require 'daedal/attributes/filter_array'
require 'daedal/attributes/score_mode'
require 'daedal/attributes/lower_case_string'
require 'daedal/attributes/distance_unit'
require 'daedal/attributes/query'
require 'daedal/attributes/filter'
require 'daedal/attributes/field'
require 'daedal/attributes/query_value'
require 'daedal/attributes/boost'
require 'daedal/attributes/pattern_flag'

# filters
require 'daedal/filters/exists_filter'
require 'daedal/filters/term_filter'
require 'daedal/filters/terms_filter'
require 'daedal/filters/range_filter'
require 'daedal/filters/geo_distance_filter'
require 'daedal/filters/and_filter'
require 'daedal/filters/or_filter'
require 'daedal/filters/bool_filter'
require 'daedal/filters/nested_filter'

# queries
require 'daedal/queries/match_all_query'
require 'daedal/queries/bool_query'
require 'daedal/queries/constant_score_query'
require 'daedal/queries/dis_max_query'
require 'daedal/queries/filtered_query'
require 'daedal/queries/match_query'
require 'daedal/queries/multi_match_query'
require 'daedal/queries/nested_query'
require 'daedal/queries/prefix_query'
require 'daedal/queries/fuzzy_query'
require 'daedal/queries/query_string_query'
require 'daedal/queries/term_query'
require 'daedal/queries/terms_query'
require 'daedal/queries/range_query'


# aggs
require 'daedal/aggs/stats_agg'
require 'daedal/aggs/terms_agg'
