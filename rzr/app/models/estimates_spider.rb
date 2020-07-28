# <div class="zestimate-value">$415,126</div>

class EstimatesSpider < Kimurai::Base
    @name = 'estimates_spider'
    @engine = :mechanize
  
    def self.process(zillow_scrape)
      @start_urls = [url]
      self.crawl!
    end
    
  end