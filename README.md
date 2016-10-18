# Magic: The Gathering - Discord Bot
This is a Magic: The Gathering Discord Bot that fetches card images.

## Setup

Create a new Discord Application

[https://discordapp.com/developers/applications/me](https://discordapp.com/developers/applications/me)

Download this Repository

    $ git clone https://github.com/MagicTheGathering/mtg-discord-bot.git

Install Dependencies

    $ bundle install

Edit __config/discord.yml__ with your token and client_id, or configure programmatically

    MtgBot.configure do |config|
      config.token = 'your token here'
      config.client_id = 123456790
    end

Start the bot

    $ rake

Once started, the bot's invite URL will be printed to the terminal. The URL looks like this:

    https://discordapp.com/oauth2/authorize?&client_id=<your-client-id>&scope=bot

After accepting the invitation, your bot is ready for use.

## Usage

To use the bot, simply type a card's name between square brackets:

    check out the [hinder] to [tunnel vision] combo

You can also specify the set code in parentheses to get a particular version of the card:

    check out the [hinder (chk)] to [tunnel vision] combo

To see all set codes, hit the following endpoint:

    https://api.magicthegathering.io/v1/sets

![http://i.imgur.com/dgDLfZD.png](http://i.imgur.com/dgDLfZD.png)
## Development

Execute the test suite

    rake test

## Contributing

1. Fork it ( https://github.com/[my-github-username]/mtg-discord-bot/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request