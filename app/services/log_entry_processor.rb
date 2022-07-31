# responsible to create Log Records from Log Entry
class LogEntryProcessor < ApplicationService
  def initialize(log_entry, separator = "\s")
    @separator = separator
    @log_entry = log_entry
    @page_stats_repository = PageStatsRepository.instance
  end

  def execute
    @log_record = split_logs_into_columns
    LogRecordValidator.validate!(log_record)
    store_log_record
  end

  private

  attr_reader :separator, :page_stats_repository, :log_entry, :log_record

  def store_log_record
    page_stat = find_or_create_page_stats
    page_stat.ingresses = Ingress.new(ip: log_record[1])
    page_stats_repository.write = page_stat
  end

  def split_logs_into_columns
    log_entry.split(separator)
  end

  def find_or_create_page_stats
    page = log_record[0]
    page_stats_repository.find(page) || PageStat.new(page)
  end
end
