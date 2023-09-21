(define (domain papyrus-paper)
  (:requirements :strips)
  (:predicates
    (papyrus-plant ?plant)
    (plant-stalk ?plant ?stalk)
    (outer-layer-removed ?plant)
    (inner-layers-cut ?plant)
    (strips-soaked ?plant)
    (strips-laid-out ?plant)
    (strips-woven ?plant)
    (drying-complete ?plant)
    (paper-flat ?plant)
    (paper-polished ?plant)
    (paper-cut ?plant)
    (paper-processed ?plant)
  )
  (:action obtain-papyrus
    :parameters (?plant)
    :precondition (and)
    :effect (and (papyrus-plant ?plant))
  )
  (:action cut-stalks
    :parameters (?plant ?stalk)
    :precondition (and (papyrus-plant ?plant))
    :effect (and (plant-stalk ?plant ?stalk))
  )
  (:action remove-outer-layer
    :parameters (?plant)
    :precondition (and (papyrus-plant ?plant) (plant-stalk ?plant ?stalk))
    :effect (and (outer-layer-removed ?plant))
  )
  (:action cut-inner-layers
    :parameters (?plant)
    :precondition (and (papyrus-plant ?plant) (outer-layer-removed ?plant))
    :effect (and (inner-layers-cut ?plant))
  )
  (:action soak-strips
    :parameters (?plant)
    :precondition (and (papyrus-plant ?plant) (inner-layers-cut ?plant))
    :effect (and (strips-soaked ?plant))
  )
  (:action lay-strips
    :parameters (?plant)
    :precondition (and (papyrus-plant ?plant) (strips-soaked ?plant))
    :effect (and (strips-laid-out ?plant))
  )
  (:action weave-strips
    :parameters (?plant)
    :precondition (and (papyrus-plant ?plant) (strips-laid-out ?plant))
    :effect (and (strips-woven ?plant))
  )
  (:action complete-drying
    :parameters (?plant)
    :precondition (and (papyrus-plant ?plant) (strips-woven ?plant))
    :effect (and (drying-complete ?plant))
  )
  (:action flatten-paper
    :parameters (?plant)
    :precondition (and (papyrus-plant ?plant) (drying-complete ?plant))
    :effect (and (paper-flat ?plant))
  )
  (:action polish-paper
    :parameters (?plant)
    :precondition (and (papyrus-plant ?plant) (paper-flat ?plant))
    :effect (and (paper-polished ?plant))
  )
  (:action cut-paper
    :parameters (?plant)
    :precondition (and (papyrus-plant ?plant) (paper-polished ?plant))
    :effect (and (paper-cut ?plant))
  )
  (:action process-paper
    :parameters (?plant)
    :precondition (and (papyrus-plant ?plant) (paper-cut ?plant))
    :effect (and (paper-processed ?plant))
  )
)