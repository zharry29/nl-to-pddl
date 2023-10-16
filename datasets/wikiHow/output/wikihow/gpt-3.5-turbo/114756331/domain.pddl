(define (domain quicksand-escape)
  (:requirements :strips :typing)
  (:types location object - physical-object)
  (:predicates
    (at ?obj - object ?loc - location)
    (wearing-backpack ?person - object)
    (carrying ?person - object ?obj - object)
    (feet-stuck ?person - object)
    (in-quicksand ?person - object)
    (sitting ?person - object)
    (leaning-back ?person - object)
    (floating ?person - object)
    (free-feet ?person - object)
    (slow-movement ?person - object)
    (relaxed ?person - object)
    (swimming ?person - object)
    (using-stick ?person - object)
    (pole-balancing ?person - object)
    (safe-location ?loc - location)
    (tired ?person - object)
    (numb-legs ?person - object)
    (exposure-risk ?person - object)
    (drowning-risk ?person - object)
    (held-stick ?person - object ?stick - object)
    (ground-unstable ?loc - location)
    (water-seeping ?loc - location)
    (test-ground ?loc - location)
  )
  (:action drop-everything
    :parameters (?person - object ?obj - object)
    :precondition (and (at ?person ?loc - location)
                      (carrying ?person ?obj)
                      (or (wearing-backpack ?person)
                          (not (wearing-backpack ?person)))
                      (not (in-quicksand ?person)))
    :effect (and (not (carrying ?person ?obj))
                 (not (wearing-backpack ?person))))
  (:action remove-shoes
    :parameters (?person - object ?shoes - object)
    :precondition (and (at ?person ?loc - location)
                      (wearing-backpack ?person)
                      (in-quicksand ?person)
                      (at ?shoes ?loc)
                      (ground-unstable ?loc)
                      (or (free-feet ?person)
                          (slow-movement ?person)))
    :effect (and (not (wearing-backpack ?person))
                 (not (held-stick ?person ?shoes))))
  (:action move-horizontally
    :parameters (?person - object ?loc1 ?loc2 - location)
    :precondition (and (at ?person ?loc1)
                      (in-quicksand ?person)
                      (ground-unstable ?loc2))
    :effect (and (at ?person ?loc2)
                 (not (at ?person ?loc1))))
  (:action lay-back
    :parameters (?person - object ?loc1 ?loc2 - location)
    :precondition (and (at ?person ?loc1)
                      (feet-stuck ?person)
                      (in-quicksand ?person)
                      (slow-movement ?person)
                      (ground-unstable ?loc2))
    :effect (and (at ?person ?loc2)
                 (sitting ?person)
                 (leaning-back ?person)
                 (floating ?person)
                 (not (feet-stuck ?person))))
  (:action take-your-time
    :parameters (?person - object ?loc1 ?loc2 - location)
    :precondition (and (at ?person ?loc1)
                      (in-quicksand ?person)
                      (slow-movement ?person)
                      (ground-unstable ?loc2))
    :effect (and (at ?person ?loc2)
                 (slow-movement ?person)))
  (:action relax
    :parameters (?person - object ?loc1 ?loc2 - location)
    :precondition (and (at ?person ?loc1)
                      (feet-stuck ?person)
                      (in-quicksand ?person)
                      (slow-movement ?person)
                      (ground-unstable ?loc2))
    :effect (and (at ?person ?loc2)
                 (relaxed ?person)
                 (floating ?person)
                 (not (feet-stuck ?person))))
  (:action get-on-back-and-swim
    :parameters (?person - object ?loc1 ?loc2 - location)
    :precondition (and (at ?person ?loc1)
                      (feet-stuck ?person)
                      (in-quicksand ?person)
                      (slow-movement ?person)
                      (ground-unstable ?loc2)
                      (relaxed ?person))
    :effect (and (at ?person ?loc2)
                 (sitting ?person)
                 (leaning-back ?person)
                 (swimming ?person)
                 (floating ?person)
                 (not (feet-stuck ?person))))
  (:action use-stick
    :parameters (?person - object ?loc1 ?loc2 - location ?stick - object)
    :precondition (and (at ?person ?loc1)
                      (feet-stuck ?person)
                      (in-quicksand ?person)
                      (slow-movement ?person)
                      (ground-unstable ?loc2)
                      (held-stick ?person ?stick))
    :effect (and (at ?person ?loc2)
                 (sitting ?person)
                 (leaning-back ?person)
                 (pole-balancing ?person)
                 (not (feet-stuck ?person))))
  (:action take-break
    :parameters (?person - object ?loc1 ?loc2 - location)
    :precondition (and (at ?person ?loc1)
                      (in-quicksand ?person)
                      (ground-unstable ?loc2)
                      (slow-movement ?person)
                      (or (tired ?person)
                          (numb-legs ?person)
                          (exposure-risk ?person)
                          (drowning-risk ?person)))
    :effect (and (at ?person ?loc2)
                 (slow-movement ?person))))
  (:action recognize-quicksand-areas
    :parameters (?loc - location)
    :precondition (and (ground-unstable ?loc)
                      (water-seeping ?loc)
                      (test-ground ?loc))
    :effect (and (ground-unstable ?loc)
                 (water-seeping ?loc)
                 (test-ground ?loc)))
  (:action tap-ground-with-stick
    :parameters (?loc - location)
    :precondition (at ?stick - object ?loc)
    :effect (test-ground ?loc))
)