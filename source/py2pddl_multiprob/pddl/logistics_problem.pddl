(define
	(problem someproblem)
	(:domain somedomain)
	(:objects
		plane - airplane
		cdg lhr - airport
		london paris - city
		p1 p2 - package
		north south - place
		truck - truck
	)
	(:init (in-city cdg paris) (in-city lhr london) (in-city north paris) (in-city south paris) (at plane lhr) (at truck cdg) (at p1 lhr) (at p2 lhr))
	(:goal (and (at p1 north) (at p2 south)))
)
