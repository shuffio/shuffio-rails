class RoyalPalmsCalendarEvent
  include ActiveModel::Model

  attr_accessor :name, :start_time, :end_time

  validates :name, :start_time, :end_time, presence: true

  def self.all
    month = DateTime.now.in_time_zone('America/Chicago').strftime('%m-%Y')
    collection = '5a734759c8302579dea87c82'
    crumb = 'BTflemBB1vFdNjhkZTMwYjQ1MDBkNTQwMGVlNDc0YzNmNDlhNWJj' # TODO: dynamic

    uri = URI.parse("https://www.royalpalmschicago.com/api/open/GetItemsByMonth?month=#{month}&collectionId=#{collection}&crumb=#{crumb}")
    response = Net::HTTP.get_response(uri)
    events = JSON.parse(response.body)

    events.reverse.map do |e|
      new(
        name: e['title'],
        start_time: DateTime.strptime(e['startDate'].to_s, '%Q'),
        end_time: DateTime.strptime(e['endDate'].to_s, '%Q')
      )
    end
  end

  def self.todays_events
    today_start = DateTime.now.in_time_zone('America/Chicago').beginning_of_day
    today_end = DateTime.now.in_time_zone('America/Chicago').end_of_day
    all.select { |e| e.start_time >= today_start && e.end_time <= today_end }
  end
end
