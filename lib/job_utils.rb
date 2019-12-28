class JobUtils
  class << self
    def schedule
      if Rails.env.test?
        Rails.logger.info('Returns an empty hash in a test environment.')
        {}
      else
        Resque.schedule
      end
    end

    def set_schedule(name, schedule_config)
      if Rails.env.test?
        Rails.logger.info('Skip adding schedules in the test environment.')
        return
      end
      Resque.set_schedule(name, schedule_config)
    end

    def remove_schedule(name)
      if Rails.env.test?
        Rails.logger.info('Skip deleting schedules in the test environment.')
        return
      end
      Resque.remove_schedule(name)
    end

    def peek(queue, start, count)
      if Rails.env.test?
        Rails.logger.info('Returns an empty array in the test environment.')
        []
      else
        Resque.peek(queue, start, count)
      end
    end
  end
end
