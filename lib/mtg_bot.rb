require_relative 'mtg_bot/card_fetcher'
require_relative 'mtg_bot/configuration'
require 'discordrb'

module MtgBot
  QUERY_REGEX = /\[([^\(]*?)(?:\((.*?)\))?\]/

  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  def self.start
    if configuration.token.nil? || configuration.client_id.nil?
      puts "Discord Configuration not set. Please either configure it programmatically or via the discord.yml file."
      return
    end

    bot = Discordrb::Bot.new token: configuration.token, client_id: configuration.client_id
    print_invite_url(bot.invite_url)

    bot.message(contains: QUERY_REGEX) do |event|
      cards = CardFetcher.fetch(event.content)
      cards.each {|card| event.respond format_card_response(card)}
    end

    bot.run
  end

  private

  def self.format_card_response(card)
    "**#{card.name}** \n#{card.set_name} (#{card.set})\n#{card.image_url}"
  end

  def self.print_invite_url(invite_url)
    puts "This bot's invite URL is #{invite_url}."
    puts 'Click on it to invite it to your server.'
  end
end