class FormatLister

  def load_modules
    Dir[File.join(File.dirname(__FILE__), 'modules', '*.rb')].each do |file| 
      require file
    end
  end

  def create_format_object(choice)
    class_name = File.basename(choice.capitalize+"Generator", '.rb')
    Object.const_get(class_name)
  end
end