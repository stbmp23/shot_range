module ShotRange
  class Subscriber
    def self.initialize!
      @events = []
    end
    instance_eval { alias :reset! :initialize! }

    def self.push_event(event)
      if self.subscribe?(event.name)
        @events << event
      end
    end

    def self.events
      @events
    end

    def self.subscribers
      [
        "process_action.action_controller",
        "!render_template.action_view",
        "render_partial.action_view",
        "sql.active_record",
        "identity.active_record",
      ]
    end

    def self.subscribe?(name)
      self.subscribers.grep(name)
    end
  end
end
