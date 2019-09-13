class GameDb::Scraper

    def self.website
        doc = Nokogiri::HTML(open("https://www.gamesdatabase.org/systems"))
        doc.css("table.NoWrap tr")[1..-1].each do |row|
            console = row.css("a")[1].text
            maker = row.css("a")[2].text
            type = row.css("td")[-2].text
            game_amount = row.css("td")[-1].text
            GameDb::Game.new(console, maker, type, game_amount)
        end
    end
end