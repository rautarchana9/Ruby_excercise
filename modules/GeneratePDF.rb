require 'prawn'

class GeneratePDF
  def self.export_user_info(info)
    Prawn::Document.generate(info[:Name].strip+".pdf")do
      info.each{|key, value| text "#{key} : #{value}"}
    end
  end
end