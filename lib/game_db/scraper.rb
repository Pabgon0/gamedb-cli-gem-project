class GameDb::Scraper

    def website
        Nokogiri::HTML(open("https://www.gamesdatabase.org/systems"))
    end

    
end