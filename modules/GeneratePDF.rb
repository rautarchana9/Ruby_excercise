class GeneratePDF
  def self.export_user_info(hash)
    Prawn::Document.generate("Resume.pdf")do
      hash.each{|key, value| text "#{key} : #{value}"}
    end
  end
end