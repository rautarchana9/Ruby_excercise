require_relative 'format_lister'

class UserInterface

  attr_reader :info, :choice
  
  def initialize
    @details = [:Name, :Age, :Education, :Place, :Marital_status ]
  end

  def display_intro
    puts "Welcome to the Resume Generator program please enter 
          your details to export your resume in desired format"
  end

  def collect_user_info
    @info = Hash.new
    @details.each do |key|
      puts key.to_s + ":"
      @info[key] = gets
    end
  end
  
  def get_user_choice
    puts "please enter the desired file format to save your resume details"
    @choice = gets.upcase
  end

end

user_interface = UserInterface.new
user_interface.display_intro
user_interface.collect_user_info
user_interface.get_user_choice
format_lister = FormatLister.new
format_lister.load_modules
desired_class = format_lister.create_format_object(user_interface.choice)
desired_class.export_user_info(user_interface.info)
at_exit{puts "Thank you. Bye"}
