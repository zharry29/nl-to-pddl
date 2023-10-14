
from py2pddl import goal, init

class JungleSurvivalProblem4(JungleSurvivalDomain):

    def __init__(self):
        super().__init__()
        self.cave = JungleSurvivalDomain.Cave.create_objs([1])
        self.fire = JungleSurvivalDomain.Fire.create_objs([1])

    @init
    def init(self):
        at = [self.cave_exists(self.cave[1]), 
              self.fire_exists(self.fire[1])]
        return at

    @goal
    def goal(self):
        return [self.cave_exists(self.cave[1]), 
                self.fire_exists(self.fire[1])]
