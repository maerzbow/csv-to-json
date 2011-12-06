require "csv"

class CsvToJson

  def process_file(csv_file_path)
    csv_table = CSV.read(csv_file_path, {headers: true, col_sep: ';'})

    csv_table.each do |row|
      csv_table.headers.each do |header|
        puts header + ": " + row[header]

      end
    end
  end

end

ctj = CsvToJson.new
ctj.process_file('test.csv')