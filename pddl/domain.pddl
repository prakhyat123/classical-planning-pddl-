;Header and description

(define (domain animat)

;remove requirements that are not needed
(:requirements :strips :fluents)

(:predicates ;todo: define predicates here
  (happy)
)


(:functions ;todo: define numeric functions here
 (gridsize)
 (xposition)
 (yposition)
 (power)
 (hunger)
 (thirst)
 (liarx)
 (liary)
 (drinkx)
 (drinky)
 (eatx)
 (eaty)
 (max)
)

;define actions here
(:action move_up
    :parameters ()
    :precondition (< (yposition) (gridsize))
    :effect (and (increase (yposition) 1)
                 (increase (hunger) 1)
                 (increase (thirst) 1)
                 (decrease (power) 1)
                  )
)

(:action move_down
    :parameters ()
    :precondition (> (yposition) 0)
    :effect (and (decrease (yposition) 1))
)

(:action move_right
    :parameters ()
    :precondition (< (xposition) (gridsize))
    :effect (and (increase (xposition) 1))
)

(:action move_left
    :parameters ()
    :precondition (> (xposition) 0)
    :effect (and (decrease (xposition) 1))
)

(:action drink
    :parameters ()
    :precondition (and (= (xposition) (drinkx))
                       (= (yposition) (drinky)))
    :effect (and (decrease (power) 1)
                 (increase (hunger) 1)
                 (assign (thirst) 0)
                 (happy))
)


(:action eat
    :parameters ()
    :precondition (and (= (xposition) (eatx))
                       (= (yposition) (eaty)))
    :effect (and (decrease (power) 1)
                (assign (hunger) 0)
                (increase (thirst) 1))
)


(:action sleep
    :parameters ()
    :precondition (and (= (xposition) (liarx))
                       (= (yposition) (liary)))
    :effect (and(assign (power) (max))
                (increase (hunger) 1)
                (increase (thirst) 1))
)

)
