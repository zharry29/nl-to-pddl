from py2pddl import goal, init

from py2pddl import Domain, create_type
from py2pddl import predicate, action

class EMPDomain(Domain):

    Place = create_type("Place")
    Person = create_type("Person")

    @predicate(Person, Place)
    def person_at(self, p, a):
        pass

    @predicate(Person, Place)
    def home(self, p, a):
        pass

    @predicate(Person)
    def has_water(self, p):
        pass
      
    @predicate(Person)
    def radio_on(self, p):
        pass
      
    @predicate(Person)
    def prepared_for_attack(self, p):
        pass

    @action(Person, Place)
    def get_home(self, p, a):
        precond = [self.person_at(p, a)]
        effect = [~self.person_at(p, a), self.home(p, a)]
        return precond, effect

    @action(Person)
    def collect_water(self, p):
        precond = [self.person_at(p)]
        effect = [self.has_water(p)]
        return precond, effect

    @action(Person)
    def turn_on_radio(self, p):
        precond = [self.home(p)]
        effect = [self.radio_on(p)]
        return precond, effect

    @action(Person)
    def prep_for_attack(self, p):
        precond = [self.radio_on(p), self.has_water(p)]
        effect = [self.prepared_for_attack(p)]
        return precond, effect

from py2pddl import goal, init

class EMPProblem4(EMPDomain):

    def __init__(self):
        super().__init__()
        self.persons = EMPDomain.Person.create_objs([1], prefix="p")
        self.places = EMPDomain.Place.create_objs(["home"], prefix="a")

    @init
    def init(self):
        at = [self.home(self.persons[1], self.places["home"]), 
              self.has_water(self.persons[1]), 
              self.radio_on(self.persons[1]), 
              self.prepared_for_attack(self.persons[1])]
        return at

    @goal
    def goal(self):
        return [self.home(self.persons[1], self.places["home"]), 
                self.has_water(self.persons[1]), 
                self.radio_on(self.persons[1]), 
                self.prepared_for_attack(self.persons[1])]
