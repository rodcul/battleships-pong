# Taken from the cucumber-rails project.

module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'

    when /the New Game page/
      '/game/new'

    when /the Game page/
      '/game'

    when /place ship page/
      '/game/place-ship'

    when /the fire page/
      '/game/fire'

    when /the fire error page/
      '/game/fire?error=wait'

    when /Player 1/
      '/player1'

    when /Player 2/
      '/player2'


    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)
