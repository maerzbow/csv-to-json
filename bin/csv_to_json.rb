#! /usr/bin/env ruby

require 'csv-to-json'

ctj = CsvToJson::Converter.new({headers: true, col_sep: ';', encoding: 'ISO-8859-1'})
ctj.process_files(ARGV)