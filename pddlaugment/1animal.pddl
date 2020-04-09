(define (problem animal1) (:domain animat)

(:objects
)

(:init
    (= (max) 15)
    (= (gridsize) 3)
    (= (liarx) 0)
    (= (liary) 0)
    (= (drinkx) 2)
    (= (drinky) 2)
    (= (xposition) 0)
    (= (yposition) 0)
    (= (power) 15)
    (= (hunger) 0)
    (= (thirst) 0)
    (= (reqxposition) 0)
    (= (reqyposition) 0)
    (= (reqpower) 15)
    (= (reqhunger) 0)
    (= (reqthirst) 0)
    (pq0)
    (f1)
)

(:goal (and
    (lf)
    (= (xposition) (reqxposition))
    (= (yposition) (reqyposition))
    (= (thirst) (reqthirst))
    (= (hunger) (reqhunger))
    (= (power) (reqpower)) )
)

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
