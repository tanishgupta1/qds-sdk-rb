require 'qubole/command'

module Qubole
  module Commands
    class Spark < Command
      def initialize(attrs = {})
        attrs[:command_type] = 'CompositeCommand'
        super(attrs)
      end
    end
  end
end
