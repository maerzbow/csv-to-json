require "csv"
require "json"

class CsvToJson

  def process_file(csv_file_path)
    json = csv_file_to_json(csv_file_path)
    puts json
  end

  def csv_file_to_json(csv_file_path)
    csv_table = CSV.read(csv_file_path, {headers: true, col_sep: ';', encoding: 'WINDOWS-1252'})

    list =   []
    csv_table.each do |row|
      entry = {}
      csv_table.headers.each do |header|
        entry[header] =  row[header]
      end
      list << entry
    end
    JSON.pretty_generate(list)
  end

end

ctj = CsvToJson.new
ctj.process_file('Flaechen.csv')