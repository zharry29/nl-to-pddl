 
from py2pddl import goal, init

class JungleSurvivalProblem1(JungleSurvivalDomain):

    def __init__(self):
        super().__init__()
        self.humans = JungleSurvivalDomain.Human.create_objs(["explorer1"])
        self.water_sources = JungleSurvivalDomain.Water.create_objs(["water_source1"])
        self.shelters = JungleSurvivalDomain.Shelter.create_objs(["shelter1"])

    @init
    def init(self):
        return []

    @goal
    def goal(self):
        return [self.has_water(self.humans["explorer1"], self.water_sources["water_source1"]),
                self.at_shelter(self.humans["explorer1"], self.shelters["shelter1"])]
