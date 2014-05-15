require 'shot_range/configurable'

module ShotRange
  class ShotRangeError < StandardError; end

  class << self
    include ShotRange::Configurable
  end

  autoload :Subscriber, 'shot_range/subscriber'
  autoload :Logger, 'shot_range/logger'

  class Railtie < ::Rails::Railtie
    initializer "shot_range.notifier_rails_initialization" do |app|
      ShotRange.setup!
      ShotRange::Subscriber.initialize!

      ActiveSupport::Notifications.subscribe do |*args|
        event = ActiveSupport::Notifications::Event.new(*args)
        ShotRange::Subscriber.push_event(event)

        if event.name == "process_action.action_controller"
          ShotRange::Logger.output(ShotRange::Subscriber.events)
          ShotRange::Subscriber.reset!
        end
      end
    end
  end
end
