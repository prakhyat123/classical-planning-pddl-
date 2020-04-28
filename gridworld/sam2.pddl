                 (when (isgather1 ?g) (and (decrease (xposition ?a) 1)
                                          (increase (totalcost) 1)
                 ) )
                 (when (isgather2 ?g) (and (decrease (yposition ?a) 1)
                                           (increase (totalcost) 1)
                 ))
                 (when (isgather3 ?g) (and (increase (xposition ?a) 1)
                                          (increase (totalcost) 1)
                 ))
                 (when (isgather4 ?g) (and (increase (yposition ?a) 1)
                                           (increase (totalcost) 1)
                 ))

                     (isgather1 ?g - gatherpoint)
    (isgather2 ?g - gatherpoint)
    (isgather3 ?g - gatherpoint)
    (isgather4 ?g - gatherpoint)

       obstacle1 - obstacle
    obstacle2 - obstacle
    obstacle3 - obstacle
    obstacle4 - obstacle
    obstacle5 - obstacle
    obstacle6 - obstacle
    obstacle7 - obstacle
    obstacle8 - obstacle
    obstacle9 - obstacle
    obstacle10 - obstacle
    obstacle11 - obstacle
    obstacle12 - obstacle


     (= (xobstacle obstacle1) 3)
 (= (yobstacle obstacle1) 6)
  (= (xobstacle obstacle2) 3)
 (= (yobstacle obstacle2) 5)
  (= (xobstacle obstacle3) 3)
 (= (yobstacle obstacle3) 3)
 (= (xobstacle obstacle4) 3)
 (= (yobstacle obstacle4) 2)
 
(= (xobstacle obstacle5) 5)
 (= (yobstacle obstacle5) 6)
  (= (xobstacle obstacle6) 5)
 (= (yobstacle obstacle6) 5)
  (= (xobstacle obstacle7) 5)
 (= (yobstacle obstacle7) 3)
 (= (xobstacle obstacle8) 5)
 (= (yobstacle obstacle8) 2)

 (= (xobstacle obstacle9) 3)
 (= (yobstacle obstacle9) 6)
  (= (xobstacle obstacle10) 5)
 (= (yobstacle obstacle10) 6)


 (= (xobstacle obstacle11) 3)
 (= (yobstacle obstacle11) 2)
  (= (xobstacle obstacle12) 5)
 (= (yobstacle obstacle12) 2)


 ; (forall(?o - obstacle) (not (and (= (xobstacle ?o) (xposition ?a)) 
                          ;                               (= (yobstacle ?o) (yposition ?a)))))