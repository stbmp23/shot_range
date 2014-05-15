module ShotRange
  class LogFormatter
    def self.format(events)
      log = {
        views: [],
        queries: [],
      }

      events.each do |event|
        formatted_data = self.to_hash(event)

        case event.name
        when "process_action.action_controller"
          log.merge!(formatted_data)
        when /action_view/
          log[:views] << formatted_data
        when /active_record/
          log[:queries] << formatted_data
        end
      end

      log
    end

    def self.to_hash(event)
      event.payload.merge(
        name: event.name,
        time: event.time,
        duration: event.duration,
      )
    end
  end
end
