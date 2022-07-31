# responsible to create Log Records from Log Entry
class LogEntryProcessor < ApplicationService
  def initialize(log_entry, separator = "\s")
    @separator = separator
    @log_entry = log_entry
  end

  def execute
    @log_record = split_logs_into_columns
    LogRecordValidator.validate!(log_record)
    page_stat = PageStat.new(log_record[0])
    page_stat.ingresses = Ingress.new(ip: log_record[1])
    PageStatsRepository.instance.write = page_stat
    true
  end

  private

  attr_reader :separator, :log_entry, :log_record

  def split_logs_into_columns
    log_entry.split(separator)
  end
end
