# class ParsersWorker
#   include Sidekiq::Worker
#   sidekiq_options queue: "high"
#   # sidekiq_options retry: false

#   def perform(track_id)
#     track = Track.find(track_id)
#     item_titles = Nokogiri::HTML(open(track.url)).css('.pl a')
#     # @item_prices = Nokogiri::HTML(open(track.url)).css('.price')
#     item_titles.each do |item|
#       parsed_item = item.attr('href')
#       puts parsed_item
#       if !parsed_item.include?('http')
#         puts "no http"
#         puts track.location
#       end
#     end
#   end
# end