require 'json'
require 'fluent-logger'

module ShotRange
  autoload :LogFormatter, 'shot_range/log_formatter'

  class Logger
    def self.output(events)
      log = ShotRange::LogFormatter.format(events)
      self.post_text(log)
    end

    def self.post_text(text)
      case ShotRange.logger
      when :logger
        Rails.logger.debug(text)
      when :file
        self.write_file(text)
      when :fluentd
        @logger.post("access_log", text)
      end
    end

    def self.create_logger(tag = "shot_range")
      if ShotRange.logger == :fluentd
        @logger = ::Fluent::Logger::FluentLogger.new(tag)
      end
    end

    def self.write_file(text)
      File.open(ShotRange.output, "a") do |f|
        f.write(JSON.generate(text))
      end
    end
  end
end
