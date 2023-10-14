Sure, here is the problem file:

```python
class SurvivalIslandProblem2(SurvivalIslandDomain):

    def __init__(self):
        super().__init__()
        self.people = SurvivalIslandDomain.Person.create_objs([1], prefix="p")

    @init
    def init(self):
        at = [self.is_on_island(self.people[1])]
        return at

    @goal
    def goal(self):
        return [self.has_clean_water(self.people[1])]
```