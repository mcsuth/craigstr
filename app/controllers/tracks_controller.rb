require 'pry'

class TracksController < ApplicationController
  def index
    $searched_item = params[:q]
    puts "====================================================================="
    puts $searched_item
    puts "====================================================================="
  end

  def search
    url = "http://sfbay.craigslist.org/search/sss?sort=priceasc&catAbb=sss&maxAsk=555&minAsk=333&query=" + $searched_item
    # url = "http://[LOCATION_CODE].craigslist.org/search/sss?sort=priceasc&catAbb=sss&maxAsk=[MAX_PRICE]&minAsk=[MIN_PRICE]&query=[SEARCHED_ITEM]"
    @item_titles = Nokogiri::HTML(open(url)).css('.pl a')
    @item_prices = Nokogiri::HTML(open(url)).css('.price')
    titles = []
    prices = []
    @item_titles.each do |item_title|
      titles << item_title.text
    end
    @item_prices.each do |item_price|
      prices << item_price.text
    end
    test = Hash[titles.zip prices]
    # HELP! THIS CONSOLIDATES THE PRICES AND TITLES... SO PRICE AND TITLE ARE NOT MATCHED UP
    render json: test
  end

  def link
    url = "http://sfbay.craigslist.org/search/sss?sort=priceasc&catAbb=sss&maxAsk=555&minAsk=333&query=" + $searched_item
    # url = "http://[LOCATION_CODE].craigslist.org/search/sss?sort=priceasc&catAbb=sss&maxAsk=[MAX_PRICE]&minAsk=[MIN_PRICE]&query=[SEARCHED_ITEM]"
    @links = Nokogiri::HTML(open(url)).css('.pl a').map { |link| link['href'] }
    # HELP! THIS CONSOLIDATES THE PRICES AND TITLES... SO PRICE AND TITLE ARE NOT MATCHED UP
    render json: @links

  end
end


