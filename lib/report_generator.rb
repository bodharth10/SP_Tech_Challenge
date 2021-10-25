# frozen_string_literal: true

class ReportGenerator
  attr_accessor :logs

  def initialize(logs)
    @logs = logs
  end

  def most_views
    sort_by_type(flag: false)
  end

  def uniq_views
    sort_by_type(flag: true).sort_by { |_k, v| v }.reverse.to_h
  end

  def print_report(views, message)
    views.each { |key, value| puts "#{key.ljust(10)}: #{value.to_s.ljust(3)}" "#{message}" }
  end

  private

  def sorted_logs
    (logs.sort_by { |_key, value| value.size }).reverse!.to_h
  end

  def sort_by_type(flag:)
    flag ? sorted_logs.transform_values { |value| value.uniq.size } : sorted_logs.transform_values(&:size)
  end
end
