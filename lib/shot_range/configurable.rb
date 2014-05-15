require 'yaml'

module ShotRange
  module Configurable
    LOGFILE_NAME = "shot_range.log"
    PROFILER_CONFIG_YAML = "rails_profiler.yaml"

    attr_reader :logger, :output

    def setup!
      self.logger = :fluentd
      self.output = Rails.root.join("log")
      load_yaml
      ShotRange::Logger.create_logger
    end

    def logger=(logger)
      if logger == :logger || logger == :fluentd || logger == :file
        @logger = logger
      else
        raise ShotRangeError, "Unknown logger type: #{logger}"
      end
    end

    def output=(output)
      if File.directory?(output)
        @output = output + LOGFILE_NAME
      else
        raise ShotRangeError, "Not exist directory: #{output}"
      end
    end

    private

    def load_yaml
      path = Rails.root.join("config", PROFILER_CONFIG_YAML)
      if File.exist?(path)
        config = YAML.load_file(path)[Rails.env]
        return unless config

        self.logger = config["logger"].to_sym if config.key?("logger")
        self.output = config["output"] if config.key?("output")
      end
    end
  end
end
