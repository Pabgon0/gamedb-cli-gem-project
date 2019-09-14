class GameDb::CLI

    def call
        GameDb::Scraper.website
        puts "Welcome to the Game Systems Database."
        puts ""

        list_systems

        puts ""
        puts "Please select a system by entering its number from 1-126."

        user_input = gets.strip.to_i

        sys = GameDb::Game.find(user_input)
        
        user_choice(sys)

        puts ""
        puts "Want data on another system? Y or N."

        pick_another

    end


    def list_systems
        GameDb::Game.all.each.with_index(1) do |object, index|
            puts "#{index}. #{object.console}"
        end
    end

    def user_choice(choice)
        puts "System Name     #{choice.console}"
        puts "Maker           #{choice.maker}"
        puts "Type            #{choice.type}"
        puts "Amount of Games #{choice.game_amount}"
    end

    def pick_another
        user_input = gets.strip.downcase

        if user_input == "y"
            GameDb::Game.clear
            call
        elsif user_input == "n"
            puts ""
            puts "Thanks for using the Games System Database. Goodbye."
            exit
        else
            puts ""
            puts "That choice is invalid, try again. Y or N."
            pick_another
        end
    end
end
