# -*- encoding: utf-8 -*-
$LOAD_PATH.unshift File.dirname(__FILE__)

require 'sendgrid4r/rest/request'

module SendGrid4r
  module REST
    module Stats
      #
      # SendGrid Web API v3 Stats - Global
      #
      module Global
        def get_global_stats(start_date:, end_date: nil, aggregated_by: nil)
          params = {
            start_date: start_date,
            end_date: end_date,
            aggregated_by: aggregated_by
          }
          resp_a = get(
            @auth, "#{SendGrid4r::Client::BASE_URL}/stats", params)
          SendGrid4r::REST::Stats.create_top_stats(resp_a)
        end
      end
    end
  end
end