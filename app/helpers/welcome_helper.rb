module WelcomeHelper
  def greetings
    if current_user && !current_user.name.nil? 
      "Hello #{current_user.name}!"
    elsif current_user
      "Hello #{current_user.email}!"
    else
      "Welcome to Mafia Game - The Judge's Note"
    end
  end
end
