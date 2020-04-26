      (forall (?a - agent) (and  (when (= (reqxposition ?a) (xposition ?a)) (endxposition ?a))
                                 (when (= (reqyposition ?a) (yposition ?a)) (endyposition ?a))  
                                 (when (and (robothasgathereddata ?a) (reqrobothasgathereddata ?a)) (endrobothasgathereddata ?a))
                                 (when (and (not (robothasgathereddata ?a)) (not(reqrobothasgathereddata ?a)) (endrobothasgathereddata ?a)))
                                 (when (and (robothasuploadeddata ?a) (reqrobothasuploadeddata ?a)) (endrobothasuploadeddata ?a))
                                 (when (and (not (robothasuploadeddata ?a)) (not (reqrobothasuploadeddata ?a)) (endrobothasuploadeddata ?a)))
                                 ))

       (forall (?a - agent ?g - gatherpoint) ( and (when (and (datagatheredfromstation ?g) (reqdatagatheredfromstation ?g)) (enddatagatheredfromstation ?g))
                                                 (when (and (not (datagatheredfromstation ?g)) (not (reqdatagatheredfromstation ?g)) (enddatagatheredfromstation ?g))
                                                 (when (and (robothasgathereddatafromstation ?a ?g) (reqrobothasgathereddatafromstation ?a ?g)) (endrobothasgathereddatafromstation ?a ?g)))
                                                 (when (and (not (robothasgathereddatafromstation ?a ?g)) (not (reqrobothasgathereddatafromstation ?a ?g))) (endrobothasgathereddatafromstation ?a ?g)))
                 ) 


                                  (forall (?a - agent ?g - gatherpoint) ( and (when (datagatheredfromstation ?g) (reqdatagatheredfromstation ?g))
                                                  (when (robothasgathereddatafromstation ?a ?g) (reqrobothasgathereddatafromstation ?a ?g)) ))


                                                                   (forall (?a - agent) (and (assign (reqxposition ?a) (xposition ?a))
                                           (assign (reqyposition ?a) (yposition ?a))
                                           (when (robothasgathereddata ?a) (reqrobothasgathereddata ?a))
                                           (when (robothasuploadeddata ?a) (reqrobothasuploadeddata ?a) ))
                                           ) 