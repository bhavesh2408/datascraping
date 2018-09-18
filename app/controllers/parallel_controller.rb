class ParallelController < ApplicationController

  def parallelrate
    require 'openssl'
    require 'open-uri'
    doc = Nokogiri::HTML(open('https://booking.village-hotels.co.uk/book/search/', :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))
    @entries = doc.css('.page-content').css('.container-inner').css('#skip').css("a").children.text
    #subtitle
    #rate = entries.css('table')[0].css('tr')[1].css('td')[1].text
    #@formattedrate = rate[6..8]
    render template: 'parallel/home'
  end

end
