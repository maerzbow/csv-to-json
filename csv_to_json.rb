#!/usr/bin/env ruby

require "csv"
require "json"

class CsvToJson
  def process_files(csv_file_paths)
    csv_file_paths.each do |path|
      process_file path
    end
  end

  def process_file(csv_file_path)
    csv_file_path = File.expand_path csv_file_path
    json = csv_file_to_json(csv_file_path)

    json_file_path = csv_file_path.sub(/\.csv$/,'.json')

    File.new(json_file_path, 'w').write(json)

    rescue => e
      puts csv_file_path + ": " + e.to_s
  end

  def csv_file_to_json(csv_file_path)
    csv_table = CSV.read(csv_file_path, {headers: true, col_sep: ';', encoding: 'ISO-8859-1'})

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
ctj.process_files(ARGV)
