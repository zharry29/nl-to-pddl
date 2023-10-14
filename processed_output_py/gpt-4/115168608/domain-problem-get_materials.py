from py2pddl import goal, init

from py2pddl import Domain, create_type
from py2pddl import predicate, action

class PaperMakingDomain(Domain):

    Material = create_type("Material")
    PapyrusPlant = create_type("PapyrusPlant")
    PapyrusPaper = create_type("PapyrusPaper")

    @predicate(Material)
    def material_available(self, m):
        pass

    @predicate(PapyrusPlant)
    def plant_available(self, p):
        pass

    @predicate(PapyrusPaper)
    def made_paper(self, pp):
        pass

    @action(Material)
    def get_materials(self, m):
        precond = [~self.material_available(m)]
        effect = [self.material_available(m)]
        return precond, effect

    @action(PapyrusPlant)
    def get_papyrus_plant(self, p):
        precond = [~self.plant_available(p)]
        effect = [self.plant_available(p)]
        return precond, effect

    @action(Material,PapyrusPlant,PapyrusPaper)
    def make_papyrus(self, m, p, pp):
        precond = [self.material_available(m), self.plant_available(p), ~self.made_paper(pp)]
        effect = [self.made_paper(pp)]
        return precond, effect

from py2pddl import goal, init

class GetMaterialsProblem(PaperMakingDomain):

    def __init__(self):
        super().__init__()
        self.materials = PaperMakingDomain.Material.create_objs(["water", "knife", "linen_cloth", "wooden_board"])

    @init
    def init(self):
        return []

    @goal
    def goal(self):
        return [self.material_available(m) for m in self.materials]
