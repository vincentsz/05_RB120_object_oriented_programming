class Mammal
  def nourish
      p "nourish: a public method of Mammal class"
  end

  protected
 
  def rest 
    p "rest: a protected method of Mammal class"
  end
   
  private
 
  def breathe  
      p "breathe: a private method of Mammal class"
   end
end

class Human < Mammal
  def survive
      p "survive: a public method of Human class"
      nourish
      rest
      breathe
  end
end
 
mike = Human.new
mike.survive