require 'minitest/autorun'
require 'minitest/pride'
require './lib/user'
require './lib/joke'
require './lib/open_mic'

class OpenMicTest < MiniTest::Test
  attr_reader :open_mic

  def setup
    @open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})
  end

  def test_it_should_exist
    assert_instance_of OpenMic, open_mic
  end

  def test_it_has_attributes
    assert_equal "Comedy Works", open_mic.location
    assert_equal "11-20-18", open_mic.date
    assert_equal [], open_mic.performers
  end

  def test_it_can_welcome_performers
    sal = User.new("Sal")
    ali = User.new("Ali")
    open_mic.welcome_performers(sal)
    open_mic.welcome_performers(ali)
 
    assert_equal [sal, ali], open_mic.performers 
  end

  def test_it_can_detect_repeated_jokes
    sal = User.new("Sal")
    ali = User.new("Ali")
    joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
    ali.learn(joke_1)
    ali.learn(joke_2)

    open_mic.welcome_performers(sal)
    open_mic.welcome_performers(ali)

    refute open_mic.repeated_jokes?
    ali.tell(sal, joke_1)
    assert open_mic.repeated_jokes?
  end
end
