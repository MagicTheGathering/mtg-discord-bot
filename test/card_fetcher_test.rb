require_relative 'test_helper'

class CardFetcherTest < Minitest::Test
  def test_fetch_with_no_matches_returns_empty_array
    cards = MtgBot::CardFetcher.fetch('this is the payload with no cards')

    assert cards.empty?
  end

  def test_fetch_with_no_results_returns_empty_array
    cards = MtgBot::CardFetcher.fetch('this is the payload [this is not a valid card]')

    assert cards.empty?
  end

  def test_fetch_with_no_set_specified_returns_card
    card = MtgBot::CardFetcher.fetch('this is the payload [zurgo helmsmasher]').first

    assert_equal 'Zurgo Helmsmasher', card.name
  end

  def test_fetch_with_set_specified_returns_card
    card = MtgBot::CardFetcher.fetch('this is the payload [zurgo helmsmasher (ktk)]').first

    assert_equal 'Zurgo Helmsmasher', card.name
    assert_equal 'KTK', card.set
  end

  def test_fetch_with_multiple_cards_returns_multiple_results
    cards = MtgBot::CardFetcher.fetch('staple cards like [demonic tutor] or [hinder]')

    assert_equal 2, cards.size
  end
end