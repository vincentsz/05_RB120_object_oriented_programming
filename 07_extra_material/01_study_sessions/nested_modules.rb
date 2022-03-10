CONSTANT = self

module A
  CONSTANT = self 
  def a
    puts CONSTANT
  end

  module B
    CONSTANT = self 
    def b
      puts CONSTANT
    end

    module C
      CONSTANT = self 
      def c
        puts CONSTANT
      end

      module D
        CONSTANT = self 
        def d
          puts CONSTANT
        end

        class Klass 
          include A

        end
      end
    end
  end
end

instance = A::B::C::D::Klass.new
p instance.a
p instance.b
p instance.c
p instance.d


# Talk through an example of each in the above code.