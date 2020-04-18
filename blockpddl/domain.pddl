
;; This is the 4-action blocks world domain which does not refer to a table object and distinguishes actions for moving blocks to-from blocks and moving blocks to-from table

(define (domain blocksworld)

(:requirements :typing :adl)

(:types block) ; we do not need a table type as we use a special ontable predicate

(:predicates
	(on ?a ?b - block)
	(clear ?a - block)
	(holding ?a - block)
	(handempty)
	(ontable ?x - block)
	
	(reqon ?a ?b - block)
	(reqclear ?a - block)
	(reqholding ?a - block)
	(reqhandempty)
	(reqontable ?x - block)
	
	(endon ?a ?b - block)
	(endclear ?a - block)
	(endholding ?a - block)
	(endhandempty)
	(endontable ?x - block)
	
	(pq0)
	(pq1)
	(pq2)
	
	(nq0)
	(nq1)
	(nq2)
	
	(f0)
	(f1)
	(f2)
	
	(ls)
	(lf)
	
	(appliedend)
	(endgame)
)

(:action pickup ; this action is only for picking from table
:parameters (?x - block)
:precondition (and (ontable ?x)
				(handempty)
				(clear ?x)
				(f0)
			)
:effect (and (holding ?x)
			 (not (handempty))
			 (not (clear ?x))
			 (not (ontable ?x))
			 (when (ls) (lf))
			 (f1)
			 (not (f0))
		)
)
(:action unstack ; only suitable for picking from block
:parameters (?x ?y - block)
:precondition (and (on ?x ?y)
				(handempty)
				(clear ?x)
				(f0)
			)
:effect (and (holding ?x)
			 (not (handempty))
			 (not (clear ?x))
			 (clear ?y)
			 (not (on ?x ?y))
			 (when (ls) (lf))
			 (f1)
			 (not (f0))
		)
)

(:action putdown
:parameters (?x - block)
:precondition (and (holding ?x)
					(f0)
			)
:effect (and (ontable ?x)
			 (not (holding ?x))
			 (handempty)
			 (clear ?x)
			 (when (ls) (lf))
			 (f1)
			 (not (f0))
		)
)

(:action stack
:parameters (?x ?y - block)
:precondition (and (holding ?x)
				(clear ?y)
				(f0)
			)
:effect (and (on ?x ?y)
			 (not (holding ?x))
			 (handempty)
			 (not (clear ?y))
			 (clear ?x)
			 (when (ls) (lf))
			 (f1)
			 (not (f0))
		)
)

(:action mv1
	:parameters ()
	:precondition (and (f1))
	:effect (and (not (f1)) 
				(f2)

				(when (and (pq0)) (and (not (pq0))
                             (nq0)
                            ))
				
				(when (and (pq0)
							(handempty)) 
							(and (not (pq0))
                             (nq1)
                            ))
				
				(when (and (pq0)
							(handempty)) 
							(and (not (pq0))
                             (nq1)
                            ))
				
				(when (and (pq1)) 
						   (and (not (pq1))
                            (nq1)
                            ))
				

				(when (and (pq1)
						 (not (handempty))) 
						   (and (not (pq1))
                            (nq2)
                            ))
			
				(when (and (pq2)
						 (handempty)) 
						   (and (not (pq2))
                            (nq1)
                            ))
				
				(when (and (pq2)) 
						   (and (not (pq2))
                            (nq0)
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
            )
)

(:action loopq2
    :parameters ()
    :precondition (and (pq2)
                        (f0)
                        (not (ls))
                        )
    :effect (and (ls)
                 (when (pq0) (not (pq0)))
                 (when (pq1) (not (pq1)))

				(when (handempty) (reqhandempty))
				(when (not (handempty)) (not(reqhandempty)))

				(forall (?a ?b - block)
					(when (and (on ?a ?b))
					(and (reqon ?a ?b))))
				
				(forall (?a ?b - block)
					(when (and (not (on ?a ?b)))
					(and (not (reqon ?a ?b)))))
				 
				(forall (?a - block)
					(when (and (clear ?a))
					(and (reqclear ?a))))
				
				(forall (?a - block)
					(when (and (not (clear ?a)))
					(and (not (reqclear ?a)))))

				(forall (?a - block)
					(when (and (holding ?a))
					(and (reqholding ?a))))

				(forall (?a - block)
					(when (and (not (holding ?a)))
					(and (not (reqholding ?a)))))

				(forall (?x - block)
					(when (and (ontable ?x))
					(and (reqontable ?x))))
				
				(forall (?x - block)
					(when (and (not (ontable ?x)))
					(and (not (reqontable ?x)))))
				 )
)

(:action end
	:parameters ()
	:precondition (and (not (appliedend))
						(lf))
	:effect (and (appliedend)
				 (not (f0))
				 (not (f1))
				 (not (f2))
				(forall (?a ?b - block)
					(when (and (on ?a ?b)
									(reqon ?a ?b))
					(and (endon ?a ?b))) 
				)

				(forall (?a ?b - block)
					(when (and (not (on ?a ?b))
									(not (reqon ?a ?b)))
					(and (endon ?a ?b))) 
				)

				(when (and (handempty)
							(reqhandempty)) (endhandempty))

				(when (and (not (handempty))
							(not (reqhandempty))) (endhandempty))

				(forall (?a - block)
					(when (and (clear ?a)
								(reqclear ?a))
					(and (endclear ?a))))

				(forall (?a - block)
					(when (and (not(clear ?a))
								(not (reqclear ?a)))
					(and (endclear ?a))))

				(forall (?a - block)
					(when (and (holding ?a)
								(reqholding ?a))
					(and (endholding ?a))))

				(forall (?a - block)
					(when (and (not (holding ?a))
								(not (reqholding ?a)))
					(and (endholding ?a))))

				(forall (?x - block)
					(when (and (ontable ?x)
								(reqontable ?x))
					(and (endontable ?x))))
				
				(forall (?x - block)
					(when (and (not (ontable ?x))
								(not (reqontable ?x)) )
					(and (endontable ?x)) ))
	)
				 
)

(:action finalmove
	:parameters ()
	:precondition (and  (lf)
						(appliedend)
						(endhandempty)
						(not (endgame))
						(forall (?a ?b - block) (endon ?a ?b))
						(forall (?a - block) (endclear ?a))
						(forall (?a - block) (endholding ?a))
						(forall (?x - block) (endontable ?x))
						)
	:effect (and (endgame))
)




)