```python
from py2pddl import goal, init

class SharkProblem4(SharkDomain):

    def __init__(self):
        super().__init__()
        self.humans = SharkDomain.Human.create_objs([1], prefix="h")
        self.sharks = SharkDomain.Shark.create_objs([1], prefix="s")
        self.positions = SharkDomain.Position.create_objs(["pos1"])
        self.weapons = SharkDomain.Weapon.create_objs(["weapon1"])

    @init
    def init(self):
        at = [self.human_at(self.humans[1], self.positions["pos1"]),
              self.shark_at(self.sharks[1], self.positions["pos1"]),
              self.watching(self.humans[1], self.sharks[1]),
              self.defended(self.humans[1]),
              self.deterred(self.sharks[1])]
        return at

    @goal
    def goal(self):
        return []
```