require 'prawn'

$headers = [:Name, :Age, :Education, :Place, :Marital_status ]
class UserInterface

  attr_reader :user_info, :user_choice
  
  def initialize
    @intro = "Welcome to the Resume Generator program please enter 
              your details to export your resume in desired format"
    #@headers = [:Name, :Age, :Education, :Place, :Marital_status ]
  end

  def display_intro
    puts @intro
  end

  def collect_user_info
    @user_info = Hash.new
    $headers.each do |key|
      puts key.to_s + ":"
      @user_info[key] = gets
    end
  end
  
  def get_user_choice
    puts "please enter the desired file format to save your resume details"
    @user_choice = gets.upcase
  end

end

class FactoryClass 

  def load_modules(user_choice)
    @modules = Array.new
    Dir[File.join(File.dirname(__FILE__), 'modules', '*.rb')].each do |file| 
      require file
    end
    class_name = File.basename("Generate"+user_choice.strip, '.rb')
    obj = Object.const_get(class_name)
  end
end

user = UserInterface.new
user.display_intro
user.collect_user_info
user.get_user_choice
file_format = FactoryClass.new
obj = file_format.load_modules(user.user_choice)
obj.export_user_info(user.user_info)
at_exit{puts "Thank you. Bye"}
