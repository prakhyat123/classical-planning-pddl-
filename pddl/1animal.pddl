(define (problem animal1) (:domain animat)

(:objects
)

(:init
    (= (max) 15)
    (= (gridsize) 3)
    (= (xposition) 0)
    (= (yposition) 0)
    (= (power) 15)
    (= (hunger) 0)
    (= (thirst) 0)
    (= (liarx) 0)
    (= (liary) 0)
    (= (drinkx) 2)
    (= (drinky) 2)
)

(:goal (and
    (= (power) 0))
)

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
