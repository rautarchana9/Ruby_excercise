require 'prawn'

class GeneratePDF
  def self.export_user_info(info)
    Prawn::Document.generate(info[:name]+".pdf")do
      info.each{|key, value| text "#{key} : #{value}"}
    end
  end
end