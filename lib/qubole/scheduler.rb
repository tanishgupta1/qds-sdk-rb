module Qubole
  class Scheduler
    attr_reader :id, :status, :raw
    attr_accessor :command_type

    def self.page(page, opts = {})
      per_page = opts[:per_page] || 10
      Qubole.get('/scheduler', page: page, per_page: per_page)['schedules'].map do |schedule|
        new.parse(schedule)
      end
    end

    def parse(attrs)
      @id = attrs['id']
      @status = attrs['status']
      @command_type = attrs['command_type']
      @raw = attrs
      self
    end
  end
end
