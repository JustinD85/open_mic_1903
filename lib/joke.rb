class Joke
  attr_reader :id, :question, :punchline

  def initialize(id, question, punchline)
    @id = id
    @question = question
    @punchline = punchline
  end
end
