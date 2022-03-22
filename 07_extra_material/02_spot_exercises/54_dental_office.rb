=begin
1. description
There's a dental office called Dental People Inc.  Within this office, there's 2 oral surgeons, 2 orthodontists, 1 general dentist.
Both general dentists and oral surgeons can pull teeth. Orthodontists cannot pull teeth.  Orthodontists straighten teeth.
All of these aforementioned specialties are dentists. All dentists graduated from dental school.  Oral surgeons place implants.
General dentists fill teeth

2. extract nouns and verbs
nouns:
- dental office
- oral surgeon
- orthodontist
- general dentist
- dentist

verbs:
- pull teeth
- straighten teeth
- graduate from dental school
- place implants
- fill teeth

3. organise nouns and verbs
- dental office
- dentist
  - graduate from dental school
- oral surgeon
  - pull teeth
  - place implants
- orthodontist
  - straighten teeth
- general dentist
  - pull teeth
  - fill teeth

=end
module Pullable
  def pull_teeth
  end
end

class DentalOffice
  def initialize
    @staff = []
  end
end

class Dentist
  def initialize
    @graduated = true
  end
end

class OralSurgeon < Dentist
  include Pullable

  def place_implants
  end
end

class Orthodontist < Dentist
  def straighten_teeth
  end
end

class GeneralDentist < Dentist
  include Pullable
  
  def fill_teeth
  end
end

