Sure, here is a problem file in PDDL format corresponding to "build teepee".

```
(define (problem problem2)
  (:domain survive_in_the_woods)
  (:objects
    location1 - location
  )
  (:init
    (at location1)
  )
  (:goal
    (has-teepee location1)
  )
)
```