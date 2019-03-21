
class OpenMic
  attr_reader :location, :date, :performers

  def initialize(info)
    @location = info[:location]
    @date = info[:date]
    @performers = []
  end

  def welcome_performers(person)
    @performers << person
  end

  def repeated_jokes?
    jokes = []
    @performers.each do |performer|
      performer.jokes.each { |joke| jokes << joke }
    end
    jokes == jokes.uniq!
  end
end
