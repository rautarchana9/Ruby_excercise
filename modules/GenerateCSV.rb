class GenerateCSV
  def self.export_user_info(info)
    puts info 
    file = File.open(info[:Name].strip+".csv", "w+")
    info.each do |key, value|
      file << "#{key}, #{value}\n"
    end
    file.close
  end
end