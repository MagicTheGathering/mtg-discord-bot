require 'mtg_sdk'

module MtgBot
  class CardFetcher

    # Fetch cards via the MTG API
    #
    # @param id [String] the discord message payload
    # @return [Array<Card>] Array of Card objects
    def self.fetch(payload)
      matches = payload.scan(QUERY_REGEX)

      cards = []
      matches.each do |match|
        card_name = match[0]
        card_set = match[1]

        query = MTG::Card.where(name: "\"#{card_name.strip}\"") if !card_name.nil?
        query = query.where(set: card_set.strip) if !card_set.nil?
        result = query.all

        # only select the results that have an image
        if result.any?
          cards.push result.select {|c| c.image_url != nil}.first
        end
      end

      return cards
    end
  end
end