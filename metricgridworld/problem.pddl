(define (problem query1) (:domain gridworld)
(:objects 
	robot1 - agent1
	robot2 - agent2

    gather1 - gatherpoint1
    gather2 - gatherpoint2
    gather3 - gatherpoint3
    gather4 - gatherpoint4

    upload1 - uploadpoint
    upload2 - uploadpoint

    obstacle1 - obstacle
    obstacle2 - obstacle
    obstacle3 - obstacle
    obstacle4 - obstacle
    obstacle5 - obstacle
    obstacle6 - obstacle
    obstacle7 - obstacle
    obstacle8 - obstacle

)

(:init
 (= (gridsize) 9)
 (= (totalcost) 0)
 (= (xposition robot1) 1)
 (= (yposition robot1) 1)
 (= (xposition robot2) 6)
 (= (yposition robot2) 2)
 ;obstacle positions
 (= (xobstacle obstacle1) 3)
 (= (yobstacle obstacle1) 6)
  (= (xobstacle obstacle2) 5)
 (= (yobstacle obstacle2) 6)
  (= (xobstacle obstacle3) 3)
 (= (yobstacle obstacle3) 5)
  (= (xobstacle obstacle4) 5)
 (= (yobstacle obstacle4) 5)
 (= (xobstacle obstacle5) 3)
 (= (yobstacle obstacle5) 3)
  (= (xobstacle obstacle6) 5)
 (= (yobstacle obstacle6) 3)
 (= (xobstacle obstacle7) 3)
 (= (yobstacle obstacle7) 2)
  (= (xobstacle obstacle8) 5)
 (= (yobstacle obstacle8) 2)
;gather coordinates
 (= (xpositiongather gather1) 3)
 (= (ypositiongather gather1) 4)
 (= (xpositiongather gather2) 4)
 (= (ypositiongather gather2) 2)
 (= (xpositiongather gather3) 5)
 (= (ypositiongather gather3) 4)
 (= (xpositiongather gather4) 4)
 (= (ypositiongather gather4) 6)
; upload coordinates
 (= (xpositionupload upload1) 1)
 (= (ypositionupload upload1) 7)
 (= (xpositionupload upload2) 7)
 (= (ypositionupload upload2) 1)
 ;starting state in automata
 (pq0)
 (f1)
)

(:goal (and
   (missioncomplete)
   (pq3)
))

;un-comment the following line if metric is needed
(:metric minimize (totalcost)
)
)
