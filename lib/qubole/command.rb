module Qubole
  class Command
    attr_reader :id, :status, :progress, :raw
    attr_accessor :command_type, :payload

    def self.page(page, opts = {})
      per_page = opts[:per_page] || 10
      Qubole.get('/commands', page: page, per_page: per_page)['commands'].map do |command|
        new.parse(command)
      end
    end

    def self.find(id)
      command = Qubole.get("/commands/#{id}")
      new.parse(command)
    end

    def initialize(attrs = {})
      self.payload = attrs
    end

    def parse(attrs)
      @id = attrs['id']
      @status = attrs['status']
      @command_type = attrs['command_type']
      @progress = attrs['progress']
      @raw = attrs
      self
    end

    def submit(params = {})
      all_payload = payload.merge(params)
      response = Qubole.post('/commands', JSON.generate(all_payload))
      parse(response)
    end

    def refresh!
      command = Qubole.get("/commands/#{id}")
      parse(command)
    end

    def results
      Qubole.get("/commands/#{id}/results")
    end

    def logs
      Qubole.get("/commands/#{id}/logs")
    end

    def jobs
      Qubole.get("/commands/#{id}/jobs")
    end

    def cancel
      Qubole.put("/commands/#{id}")
    end
  end
end
