require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke'

class JokeTest < MiniTest::Test
  attr_reader :joke

  def setup
    @joke = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.") 
  end

  def test_it_should_exist
    assert_instance_of Joke, joke
  end

  def test_it_should_have_attributes
    assert_equal 1, joke.id
    assert_equal "Why did the strawberry cross the road?", joke.question
    assert_equal "Because his mother was in a jam.", joke.punchline
  end
end
