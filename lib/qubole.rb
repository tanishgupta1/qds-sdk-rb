require "qubole/version"
require "qubole/exceptions"
require "qubole/commands"
require "qubole/scheduler"
require "net/http"
require "json"

module Qubole
  ACCESS_URL = 'https://api.qubole.com/api/'
  API_VERSION = 'v1.2'

  class << self
    attr_accessor :api_token, :version

    # 
    # API version
    # 
    # @return [String] API version used
    def version
      @version || API_VERSION
    end

    # 
    # Configure Qubole
    # @param params [Hash] configuration parameters
    # @option params [String] :api_token Qubole API token
    # @option params [String] :version Qubole API version (v1.2 be default)
    # 
    def configure(params)
      self.api_token = params[:api_token]
      self.version = params[:version]
    end

    # 
    # GET Request to Qubole
    # @param path [String] API path
    # @param params [Hash] GET parameters
    # 
    # @return [Hash|Array] parsed JSON response
    def get(path, params = nil)
      http(path, params) do |http, uri|
        http.get(uri, headers)
      end
    end

    # 
    # POST Request to Qubole
    # @param path [String] API path
    # @param data [String] POST data
    # 
    # @return [Hash|Array] parsed JSON response
    def post(path, data)
      http(path) do |http, uri|
        http.post(uri, data, headers)
      end
    end

    def put(path)
      http(path) do |http, uri|
        http.send_request('GET', uri, headers)
      end
    end

    # 
    # Request headers
    # 
    # @return [Hash] request headers
    def headers
      {
        'Content-Type' => 'application/json',
        'Accept' => 'application/json',
        'X-AUTH-TOKEN' => @api_token
      }
    end

    # 
    # HTTP request to Qubole
    # @param path [String] API path
    # @param params [Hash] GET parameters
    # @yieldparam [Net::HTTP] http HTTP connection
    # @yieldparam [URI] uri request URI
    # 
    # @return [Hash|Array] parsed JSON response
    def http(path, params = nil, &block)
      # Build URI
      uri = URI(ACCESS_URL + version)
      uri.path += path
      uri.query = URI.encode_www_form(params) if params

      # Open connection
      res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
        # Execute request
        yield(http, uri)
      end

      # Raise error message if not success
      raise HttpException.new(res) unless res.is_a? Net::HTTPSuccess
      # Parse JSON body
      JSON.parse(res.body) rescue res.body
    end
  end
end
