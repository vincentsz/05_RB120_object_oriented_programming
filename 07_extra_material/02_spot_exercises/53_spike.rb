=begin
1.description
+ Inside a preschool there are children, teachers, class assistants, a principle, janitors, and cafeteria workers. 
+ Both teachers and assistants can help a student with schoolwork and watch them on the playground. 
+ A teacher teaches and an assistant helps kids with any bathroom emergencies.
+ Kids themselves can learn and play. A teacher and principle can supervise a class. 
+ Only the principle has the ability to expel a kid. 
+ Janitors have the ability to clean. 
+ Cafeteria workers have the ability to serve food. 
+ Children, teachers, class assistants, principles, janitors and cafeteria workers all have the ability to eat lunch.

2. extract nouns and verbs
nouns:
- preschool
- child
- teacher
- class assistant
- principle
- janitor
- cafetaria worker

verbs:
- help with schoolwork
- watch playground
- teach
- help with bathroom
- learn
- play
- supervise class
- expel child
- clean
- serve food
- eat lunch

3. order nouns with verbs

- preschool
- child
  - learn
  - play
  - eat lunch
- teacher
  - help with schoolwork
  - watch playground
  - teach
  - supervise class
  - eat lunch
- class assistant
  - help with schoolwork
  - watch playground
  - help with bathroom
  - eat lunch
- principle
  - supervise class
  - expel child
  - eat lunch
- janitor
  - clean
- cafetaria worker
  - serve food
  - eat lunch

4.code
=end

module Supervisable
  def supervise_class
  end
end

module Watchable
  def watch_playground
  end
end

module Helpable
  def help_with_schoolwork
  end
end

class Preschool
  def initialize
    @children = (1..100).map{|_|Child.new}
    @staff = (1..10).map{|_|Teacher.new} + (1..10).map{|_|ClassAssistant.new} + [Principle.new] + (1..2).map{|_|Janitor.new} + (1..5).map{|_|CafetariaWorker.new}
  end
end

class Person
  def eat_lunch
  end
end

class Child < Person
  def learn
  end

  def play
  end
end

class Teacher < Person
  include Supervisable
  include Helpable
  include Watchable

  def teach
  end
end

class ClassAssistant < Person
  include Helpable
  include Watchable

  def help_with_bathroom
  end
end

class Principle < Person
  include Supervisable

  def expel_child
  end
end

class Janitor < Person
  def clean
  end
end

class CafetariaWorker < Person
  def serve_food
  end
end





