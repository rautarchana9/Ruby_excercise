class GenerateCSV
  def self.export_user_info(hash)
    file = File.open("Resume.csv", "w+")
    hash.each do |key, value|
      file << "#{key}, #{value}\n"
    end
    file.close
  end
end