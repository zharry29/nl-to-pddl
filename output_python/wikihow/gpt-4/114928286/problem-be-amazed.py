Of course, here's the PDDL problem file for the task "amaze" in python format:

```python
from py2pddl import goal, init

class AmazeProblem(PiApproximationDomain):

    def __init__(self):
        super().__init__()
        self.fooditems = PiApproximationDomain.FoodItem.create_objs(["hotdog"])

    @init
    def init(self):
        at = [self.fooditem_at_hand(self.fooditems["hotdog"])]
        return at

    @goal
    def goal(self):
        return [self.fooditem_crossed(self.fooditems["hotdog"])]
```
Did I get it right?