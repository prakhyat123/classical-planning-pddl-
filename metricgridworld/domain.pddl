;Header and description

(define (domain gridworld)

;remove requirements that are not needed
(:requirements :typing :fluents :conditional-effects :negative-preconditions :universal-preconditions)
(:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
    gatherpoint1 gatherpoint2 gatherpoint3 gatherpoint4 - gatherpoint
    uploadpoint obstacle - object
    agent1 agent2 - agent
)

; un-comment following line if constants are needed
;(:constants )

(:predicates ;todo: define predicates here
    (robothasgathereddata ?a - agent)
    (robothasuploadeddata ?a - agent)
    (datagatheredfromstation ?g - gatherpoint)
    (robothasgathereddatafromstation ?a - agent ?g - gatherpoint)
    (reqdatagatheredfromstation ?g - gatherpoint)
    (enddatagatheredfromstation ?g - gatherpoint)
    ;infinite plan requirements
    (pq0)
    (pq1)
    (pq2)
    (pq3)
    (pq4)
    (nq0)
    (nq1)
    (nq2)
    (nq3)
    (nq4)
    (f0)
    (f1)
    (f2)
    (ls)
    (lf)
    (end)
    (missioncomplete)
)


(:functions ;todo: define numeric functions here
 (gridsize) - number
 (totalcost)- number
 (xposition ?a - agent)- number
 (yposition ?a - agent)- number
 (xobstacle ?x - obstacle)
 (yobstacle ?y - obstacle)
 (xpositiongather ?g - gatherpoint)
 (ypositiongather ?g - gatherpoint)
 (xpositionupload ?g - uploadpoint)
 (ypositionupload ?g - uploadpoint)
 ;infintie plan requirement
 (reqxposition ?a - agent)- number
 (reqyposition ?a - agent)- number
)

;define actions here
(:action stay
    :parameters (?a - agent)
    :precondition (and (f0)
                        (not (exists(?o - obstacle) (and (= (xobstacle ?o) (xposition ?a)) 
                                                         (= (yobstacle ?o) (yposition ?a)))))
    )
    :effect (and (when (ls) (lf))
                 (not (f0))
                 (f1)
                 (forall (?g - gatherpoint) (not (datagatheredfromstation ?g)))
    )
)


(:action move_up
    :parameters (?a - agent)
    :precondition (and (f0)
                        (not (exists(?o - obstacle) (and (= (xobstacle ?o) (xposition ?a)) 
                                                         (= (yobstacle ?o) (yposition ?a)))))
    (< (yposition ?a) (gridsize)))
    :effect (and (increase (yposition ?a) 1)
                 (when (ls) (increase (totalcost) 1))
                 (when (ls) (lf))
                 (not (f0))
                 (f1)
                  (forall (?g - gatherpoint) (not (datagatheredfromstation ?g)))
    )
)

(:action move_down
    :parameters (?a - agent)
    :precondition (and (f0)
                       (not (exists(?o - obstacle) (and (= (xobstacle ?o) (xposition ?a)) 
                                                         (= (yobstacle ?o) (yposition ?a)))))
    (> (yposition ?a) 0))
    :effect (and (decrease (yposition ?a) 1)
                 (when (ls) (increase (totalcost) 1))
                 (when (ls) (lf))
                 (not (f0))
                 (f1)
                  (forall (?g - gatherpoint) (not (datagatheredfromstation ?g)))
            )
)

(:action move_right
    :parameters (?a - agent)
    :precondition (and (f0)
                        (not (exists(?o - obstacle) (and (= (xobstacle ?o) (xposition ?a)) 
                                                         (= (yobstacle ?o) (yposition ?a)))))
     (< (xposition ?a) (gridsize)))
    :effect (and (increase (xposition ?a) 1)
                (when (ls) (increase (totalcost) 1))
                (when (ls) (lf))
                (not (f0))
                (f1)
                (forall (?g - gatherpoint) (not (datagatheredfromstation ?g)))
                )
)

(:action move_left
    :parameters (?a - agent)
    :precondition (and (f0)
                       (not (exists(?o - obstacle) (and (= (xobstacle ?o) (xposition ?a)) 
                                                         (= (yobstacle ?o) (yposition ?a)))))
     (> (xposition ?a) 0))
    :effect (and (decrease (xposition ?a) 1)
                 (when (ls) (increase (totalcost) 1))
                 (when (ls) (lf))
                 (not (f0))
                 (f1)
                 (forall (?g - gatherpoint) (not (datagatheredfromstation ?g)))
                )
)

(:action gather_data
    :parameters (?a - agent ?g - gatherpoint)
    :precondition (and (f0)
                       (= (xposition ?a) (xpositiongather ?g))
                       (= (yposition ?a) (ypositiongather ?g))
                       )
    :effect (and ;(when (ls) (lf))
                 (not (f0))
                 (f1)
                 (robothasgathereddata ?a) 
                 (datagatheredfromstation ?g)
                 (robothasgathereddatafromstation ?a ?g))
)

(:action upload_data
    :parameters (?a - agent ?u - uploadpoint)
    :precondition (and (f0)
                       (= (xposition ?a) (xpositionupload ?u))
                       (= (yposition ?a) (ypositionupload ?u))
                       )
    :effect (and    ;(when (ls) (lf))
                    (not (f0))
                    (f1)
                    (robothasuploadeddata ?a))
)


(:action mv1
    :parameters ()
    :precondition (and (f1))
    :effect (and (not (f1))
                 (f2)
            ;outward transition from pq0
            (when (and (pq0)) (and (not (pq0))
                             (nq0)
                            ))
            
            (when (and (exists (?g1 - gatherpoint1) (datagatheredfromstation ?g1))
            (pq0)) (and (not (pq0))
                             (nq1)
                            ))
            
            (when (and (exists (?g1 - gatherpoint1) (datagatheredfromstation ?g1))
                       (exists (?g2 - gatherpoint2) (datagatheredfromstation ?g2))
            (pq0)) (and (not (pq0))
                             (nq4)
                            ))

            ;outward transition from pq1
            (when (and (pq1)) (and (not (pq1))
                             (nq1)
                            ))
            
            (when (and (exists (?g2 - gatherpoint2) (datagatheredfromstation ?g2))
            (pq1)) (and (not (pq1))
                             (nq4)
                            ))
            
            (when (and (exists (?g2 - gatherpoint2) (datagatheredfromstation ?g2))
                       (exists (?g3 - gatherpoint3) (datagatheredfromstation ?g3))
            (pq1)) (and (not (pq1))
                             (nq2)
                            ))
            
            ;outward transition from pq2
            (when (and (pq2)) (and (not (pq2))
                             (nq2)
                            ))

            (when (and (exists (?g4 - gatherpoint4) (datagatheredfromstation ?g4))
            (pq2)) (and (not (pq2))
                             (nq3)
                            ))

            ;outward transition from pq3
            (when (and (pq3)) (and (not (pq3))
                             (nq0)
                            ))
            
            (when (and (exists (?g1 - gatherpoint1) (datagatheredfromstation ?g1))
            (pq3)) (and (not (pq3))
                             (nq1)
                            ))

            (when (and (exists (?g1 - gatherpoint1) (datagatheredfromstation ?g1))
                       (exists (?g2 - gatherpoint2) (datagatheredfromstation ?g2))
            (pq3)) (and (not (pq3))
                             (nq4)
                            ))
            
            ;outward transition from pq4
            (when (and (pq4)) (and (not (pq4))
                             (nq4)
                            ))
            
            (when (and (exists (?g3 - gatherpoint3) (datagatheredfromstation ?g3))
            (pq4)) (and (not (pq4))
                             (nq2)
                            ))
            
            (when (and (exists (?g3 - gatherpoint3) (datagatheredfromstation ?g3))
                       (exists (?g4 - gatherpoint4) (datagatheredfromstation ?g4))
            (pq4)) (and (not (pq4))
                             (nq3)
                            ))


                )
)

(:action mv2
    :parameters ()
    :precondition (and (f2))
    :effect (and (not (f2))
                (f0)
                
                (when (nq0) (and (pq0)
                                (not (nq0))))
                
                (when (nq1) (and (pq1)
                                (not (nq1))))
                
                (when (nq2) (and (pq2)
                                (not (nq2))))
                
                (when (nq3) (and (pq3)
                                (not (nq3)))) 

                (when (nq4) (and (pq4)
                                (not (nq4))))   
            )
)

(:action infiniteloopstart
    :parameters ()
    :precondition (and (pq3)
                        (f0)
                        (not (ls)))
    :effect (and (ls)
                 (when (pq0) (not (pq0)))
                 (when (pq1) (not (pq1)))
                 (when (pq2) (not (pq2)))
                 (when (pq4) (not (pq4)))
                 (forall (?a - agent) (and (assign (reqxposition ?a) (xposition ?a))
                                           (assign (reqyposition ?a) (yposition ?a)))
                                           )
                (forall (?g - gatherpoint)
					(when (and (datagatheredfromstation ?g))
					(and (reqdatagatheredfromstation ?g))))
)
)              

(:action endgame
    :parameters ()
    :precondition (and (lf))
    :effect (and (end)
                (forall (?g - gatherpoint)
					(when (and (datagatheredfromstation ?g)
								(reqdatagatheredfromstation ?g))
					(and (enddatagatheredfromstation ?g))))
                
                (forall (?g - gatherpoint)
					(when (and (not(datagatheredfromstation ?g))
								(not (reqdatagatheredfromstation ?g)))
					(and (enddatagatheredfromstation ?g))))
))


(:action mission_over
    :parameters ()
    :precondition (and (end)
                       (forall (?g - gatherpoint) (enddatagatheredfromstation ?g))
                       (forall (?a - agent) (= (reqxposition ?a) (xposition ?a)))
                       (forall (?a - agent) (= (reqyposition ?a) (yposition ?a))) 
    )
    :effect (and (missioncomplete))
)


)