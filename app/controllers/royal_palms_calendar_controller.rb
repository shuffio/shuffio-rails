class RoyalPalmsCalendarController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    events = RoyalPalmsCalendarEvent.todays_events.map do |e|
      "#{e.start_time.in_time_zone('America/Chicago').strftime('%-I:%M%p').downcase} #{e.name}"
    end

    render json: {
      'response_type': 'in_channel',
      'text': "*Today's Events at Royal Palms:*\n#{events.join("\n")}",
      'mrkdwn': true
    }
  end
end
