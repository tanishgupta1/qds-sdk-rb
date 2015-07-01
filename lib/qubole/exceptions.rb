module Qubole
  class HttpException < StandardError
    def initialize(object)
      super(object.message)
      warn "Response: #{object.body}"
    end
  end
end
