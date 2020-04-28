;Header and description

(define (domain gridworld)

(:requirements :typing :conditional-effects :negative-preconditions :universal-preconditions :action-costs)
(:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
    agent position - object
    agent1 agent2 - agent
    gatherposition - position
    gatherposition1 gatherposition2 gatherposition3 gatherposition4 - gatherposition
)

(:predicates
    (robot1loopstart ?p - position)
    (robot2loopstart ?p - position)
    (connection ?n1 - position ?n2 - position)
    (robotat ?a - agent ?p - position)
    (datagatheredfromstation ?g - gatherposition)
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
    (endmission)
    (missioncomplete)
)


(:functions ;todo: define numeric functions here
 (total-cost)- number
)

(:action move
    :parameters (?a - agent ?n1 - position ?n2 - position)
    :precondition (and (f0)
                       (not (ls))
                       (robotat ?a ?n1)
                       (connection ?n1 ?n2)
    )
    :effect (and (not (robotat ?a ?n1))
                 (robotat ?a ?n2)
                 (not (f0))
                 (f1)
                 (forall (?g - gatherposition) (not (datagatheredfromstation ?g)))
    )
)

(:action move_loopstart
    :parameters (?a - agent ?n1 - position ?n2 - position)
    :precondition (and (f0)
                       (ls)
                       (robotat ?a ?n1)
                       (connection ?n1 ?n2)
    )
    :effect (and (not (robotat ?a ?n1))
                 (robotat ?a ?n2)
                 (lf)
                 (not (f0))
                 (f1)
                 (increase (total-cost) 1)
                 (forall (?g - gatherposition) (not (datagatheredfromstation ?g)))
    )
)

(:action gather_data
    :parameters (?a - agent ?g - gatherposition)
    :precondition (and (f0)
                       (robotat ?a ?g)
                       )
    :effect (and (not (f0))
                 (f1)
                 (datagatheredfromstation ?g))
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
            
            (when (and (exists (?g1 - gatherposition1) (datagatheredfromstation ?g1))
            (pq0)) (and (not (pq0))
                             (nq1)
                            ))
            
            (when (and (exists (?g1 - gatherposition1) (datagatheredfromstation ?g1))
                       (exists (?g2 - gatherposition2) (datagatheredfromstation ?g2))
            (pq0)) (and (not (pq0))
                             (nq4)
                            ))

            ;outward transition from pq1
            (when (and (pq1)) (and (not (pq1))
                             (nq1)
                            ))
            
            (when (and (exists (?g2 - gatherposition2) (datagatheredfromstation ?g2))
            (pq1)) (and (not (pq1))
                             (nq4)
                            ))
            
            (when (and (exists (?g2 - gatherposition2) (datagatheredfromstation ?g2))
                       (exists (?g3 - gatherposition3) (datagatheredfromstation ?g3))
            (pq1)) (and (not (pq1))
                             (nq2)
                            ))
            
            ;outward transition from pq2
            (when (and (pq2)) (and (not (pq2))
                             (nq2)
                            ))

            (when (and (exists (?g4 - gatherposition4) (datagatheredfromstation ?g4))
            (pq2)) (and (not (pq2))
                             (nq3)
                            ))

            ;outward transition from pq3
            (when (and (pq3)) (and (not (pq3))
                             (nq0)
                            ))
            
            (when (and (exists (?g1 - gatherposition1) (datagatheredfromstation ?g1))
            (pq3)) (and (not (pq3))
                             (nq1)
                            ))

            (when (and (exists (?g1 - gatherposition1) (datagatheredfromstation ?g1))
                       (exists (?g2 - gatherposition2) (datagatheredfromstation ?g2))
            (pq3)) (and (not (pq3))
                             (nq4)
                            ))
            
            ;outward transition from pq4
            (when (and (pq4)) (and (not (pq4))
                             (nq4)
                            ))
            
            (when (and (exists (?g3 - gatherposition3) (datagatheredfromstation ?g3))
            (pq4)) (and (not (pq4))
                             (nq2)
                            ))
            
            (when (and (exists (?g3 - gatherposition3) (datagatheredfromstation ?g3))
                       (exists (?g4 - gatherposition4) (datagatheredfromstation ?g4))
            (pq4)) (and (not (pq4))
                             (nq3)
                            ))
                )
)

(:action mv2
    :parameters ()
    :precondition (and (f2)
    )
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
    :parameters (?a1 - agent1 ?a2 - agent2 ?p1 - position ?p2 - position)
    :precondition (and  (robotat ?a1 ?p1)
                        (robotat ?a2 ?p2)
                        (f0)
                        (pq3)
                        (not (ls)))
    :effect (and (ls)
                 (when (pq0) (not (pq0)))
                 (when (pq1) (not (pq1)))
                 (when (pq2) (not (pq2)))
                 (when (pq4) (not (pq4)))
                 (robot1loopstart ?p1)
                 (robot2loopstart ?p2)
)
)         


(:action mission_over
    :parameters (?a1 - agent1 ?a2 - agent2 ?p1 - position ?p2 - position)
    :precondition (and (lf)
                       (pq3)
                       (f0)
                       (robot1loopstart ?p1)
                       (robot2loopstart ?p2)
                       (robotat ?a1 ?p1)
                       (robotat ?a2 ?p2)
                       )
    :effect (and (missioncomplete))
)

)