(define (problem escape_island)
  (:domain island_survival)
  (:objects 
        john - person 
        raft - tool
  )
  (:init 
        (has john raft)
  )
  (:goal 
        (island_escaped) 
  )
)