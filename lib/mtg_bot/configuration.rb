require 'yaml'

module MtgBot
  class Configuration
    attr_accessor :token, :client_id

    def initialize
      config = YAML.load_file('config/discord.yml')

      @token = config['token']
      @client_id = config['client_id']
    end
  end
end