Sure, here's a PDDL problem file corresponding to the task "o everything":

```scheme
(define (problem survival-task)
    (:domain survival)
    (:objects
        location1 location2 - location
        water1 water2 - water
        container1 - container
    )
    (:init
        (at location1)
        (container container1)
        (drinkable water2)
        (shelter location2)
    )
    (:goal (and
        (has water1)
        (has water2)
        (at location2)
    ))
    (:metric minimize (total-cost))
)
```

This file defines a problem where the goal is to have collected both available sources of water and reached location 2, which is a shelter.