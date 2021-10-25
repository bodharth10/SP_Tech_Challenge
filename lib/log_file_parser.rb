# frozen_string_literal: true

class LogFileParser
  attr_reader :file_path

  def initialize(file_path)
    file_exists?(file_path)
    @file_path = file_path
  end

  def parse_file
    logs = Hash.new { |hash, key| hash[key] = [] }
    file = File.open(@file_path, 'r')
    while line = file.gets
      request, ip = line.split(' ')
      (logs[request] ||= []) << ip
    end
    return logs
    file.close
  end

  def file_exists?(file_path)
    raise "No such file or directory exits at #{file_path}" unless File.exist? file_path
  end
end
