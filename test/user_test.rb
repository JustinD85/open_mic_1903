require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke'
require './lib/user'

class UserTest < MiniTest::Test
  attr_reader :sal, :ali

  def setup
    @sal = User.new("Sal")
    @ali = User.new("Ali")
  end

  def test_it_should_exist
    assert_instance_of User, sal
  end

  def test_it_should_have_attributes
    assert_equal "Sal", sal.name
    assert_equal [], sal.jokes
  end

  def test_it_can_learn_jokes
    joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
    sal.learn(joke_1)
    sal.learn(joke_2)

    assert_equal [joke_1, joke_2], sal.jokes
  end

  def test_user_will_learn_joke_when_told_joke
    joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
    sal.learn(joke_1)
    sal.learn(joke_2)

    sal.tell(ali, joke_1)
    assert_equal [joke_1], ali.jokes

    sal.tell(ali, joke_2)
    assert_equal [joke_1, joke_2], ali.jokes
  end

  def test_it_can_find_joke_by_id
    joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
    sal.learn(joke_1)
    sal.learn(joke_2)
    sal.tell(ali, joke_1)
    sal.tell(ali, joke_2)

    assert_instance_of Joke, ali.joke_by_id(1)
    assert_instance_of Joke, ali.joke_by_id(2)
    assert_equal joke_1.question, ali.joke_by_id(1).question
    assert_equal joke_2.question, ali.joke_by_id(2).question
  end
end
