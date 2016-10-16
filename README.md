# Magic: The Gathering - Discord Bot
This is a Magic: The Gathering Discord Bot that fetches card images.

## Usage

Install Dependencies

    $ bundle install

Edit __config/discord.yml__ with your token and client_id, or configure programmatically

    MtgBot.configure do |config|
      config.token = 'your token here'
      config.client_id = 123456790
    end

Start the bot

    rake

Once started, the bot's invite URL will be printed to the terminal. The URL looks like this:

    https://discordapp.com/oauth2/authorize?&client_id=<your-client-id>&scope=bot

After accepting the invitation, your bot is ready for use.

## Development

Execute the test suite

    rake test

## Contributing

1. Fork it ( https://github.com/[my-github-username]/mtg-discord-bot/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request