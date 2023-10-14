Sure, here is a PDDL domain file in python format for the task of making papyrus:

```python
from py2pddl import Domain, create_type
from py2pddl import predicate, action

class PapyrusMakingDomain(Domain):

    Papyrus = create_type("Papyrus")
    BaseMaterial = create_type("BaseMaterial")

    @predicate(Papyrus)
    def papyrus_finished(self, p):
        pass

    @predicate(BaseMaterial)
    def material_soaked(self, m):
        pass

    @predicate(BaseMaterial)
    def material_flattened(self, m):
        pass

    @predicate(Papyrus)
    def papyrus_aired(self, p):
        pass
  
    @predicate(Papyrus)
    def papyrus_strips_made(self, p):
        pass

    @predicate(Papyrus)
    def papyrus_cut(self, p):
        pass

    @action(BaseMaterial)
    def soak_material(self, m):
        precond = []
        effect = [self.material_soaked(m)]
        return precond, effect

    @action(BaseMaterial)
    def flatten_material(self, m):
        precond = [self.material_soaked(m)]
        effect = [self.material_flattened(m)]
        return precond, effect
  
    @action(Papyrus)
    def create_strips(self, p):
        precond = [self.material_flattened(p)]
        effect = [self.papyrus_strips_made(p)]
        return precond, effect

    @action(Papyrus)
    def make_papyrus(self, p):
        precond = [self.papyrus_strips_made(p)]
        effect = [self.papyrus_finished(p)]
        return precond, effect
  
    @action(Papyrus)
    def air_papyrus(self, p):
        precond = [self.papyrus_finished(p)]
        effect = [self.papyrus_aired(p)]
        return precond, effect
    
    @action(Papyrus)
    def cut_papyrus(self, p):
        precond = [self.papyrus_aired(p)]
        effect = [self.papyrus_cut(p)]
        return precond, effect
```
This file contains the essential procedures involved in the process of making papyrus, such as soaking and flattening the base materials, creating strips, cutting and airing the finished papyrus sheets.