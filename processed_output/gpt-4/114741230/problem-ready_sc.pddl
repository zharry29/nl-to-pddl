(define (problem ady_sc)
    (:domain secret_society)
    (:objects 
        ady - friend
        sc - friend
    )
    (:init
        (secret_created ady)
        (members_added ady)
    )
    (:goal
        (and
            (society_created sc)
        )
    )
)