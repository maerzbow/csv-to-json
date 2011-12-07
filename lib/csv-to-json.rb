require "csv-to-json/version"

require "csv"
require "json"

module CsvToJson
  class Converter
    def initialize(csv_reader_options = {})
      @csv_reader_options = csv_reader_options
    end

    def process_files(csv_file_paths)
      csv_file_paths.each do |path|
        process_file path
      end
    end

    def process_file(csv_file_path)
      csv_file_path = File.expand_path csv_file_path
      json = csv_file_to_json(csv_file_path)

      json_file_path = convert_csv_to_json_file_path(csv_file_path)

      File.new(json_file_path, 'w').write(json)

    rescue => e
      puts csv_file_path + ": " + e.to_s
    end

    def convert_csv_to_json_file_path(csv_file_path)
      csv_file_path.sub(/\.csv$/, '.json')
    end


    def csv_file_to_json(csv_file_path)
      csv_table = CSV.read(csv_file_path, @csv_reader_options)

      list = []
      csv_table.each do |row|
        entry = {}
        csv_table.headers.each do |header|
          entry[header] = row[header]
        end
        list << entry
      end
      JSON.pretty_generate(list)
    end
  end
end


