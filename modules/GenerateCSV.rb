class GenerateCSV
  def self.export_user_info(info)
    file = File.open(info[:name]+".csv", "w+")
    info.each do |key, value|
      file << "#{key}, #{value}\n"
    end
    file.close
  end
end