class Hello

  def hi
    puts 'hi there!'
  end

  def self.hi
    new.hi
  end

end

Hello.hi
