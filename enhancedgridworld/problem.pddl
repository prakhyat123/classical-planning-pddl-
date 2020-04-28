(define (problem query1) (:domain gridworld)
(:objects 
	 robot1 - agent1
	 robot2 - agent2

    node0x0y - position node0x1y - position node0x2y - position node0x3y - position node0x4y - position
    node0x5y - position node0x6y - position node1x0y - position node1x1y - position node1x2y - position
    node1x3y - position node1x4y - position node1x5y - position node1x6y - position node2x0y - position
    node2x1y - position node2x2y - position node2x3y - gatherposition2 node2x4y - position node2x5y - position
    node2x6y - position node3x0y - position node3x1y - position node3x2y - position node3x3y - position
    node3x4y - position node3x5y - position node3x6y - position node4x0y - position node4x1y - position
    node4x2y - gatherposition1 node4x3y - position node4x4y - gatherposition3 node4x5y - position node4x6y - position
    node5x0y - position node5x1y - position node5x2y - position node5x3y - position node5x4y - position
    node5x5y - position node5x6y - position node6x0y - position node6x1y - position node6x2y - position
    node6x3y - gatherposition4 node6x4y - position node6x5y - position node6x6y - position node7x0y - position
    node7x1y - position node7x2y - position node7x3y - position node7x4y - position node7x5y - position
    node7x6y - position node8x0y - position node8x1y - position node8x2y - position node8x3y - position
    node8x4y - position node8x5y - position node8x6y - position
)

(:init
 (= (total-cost) 0)
 (robotat robot1 node0x0y)
 (robotat robot2 node8x6y)
 (pq0)
 (f1)
 ;defining connections
 ;moving up
 (connection node0x0y node1x0y) (connection node0x1y node1x1y) (connection node0x2y node1x2y) (connection node0x3y node1x3y) (connection node0x4y node1x4y) (connection node0x5y node1x5y) (connection node0x6y node1x6y)
 (connection node1x0y node2x0y) (connection node1x1y node2x1y) (connection node1x3y node2x3y) (connection node1x5y node2x5y) (connection node1x6y node2x6y)
 (connection node2x0y node3x0y) (connection node2x1y node3x1y) (connection node2x5y node3x5y) (connection node2x6y node3x6y)
 (connection node3x0y node4x0y) (connection node3x1y node4x1y) (connection node3x5y node4x5y) (connection node3x6y node4x6y)
 (connection node4x0y node5x0y) (connection node4x1y node5x1y) (connection node4x5y node5x5y) (connection node4x6y node5x6y)
 (connection node5x0y node6x0y) (connection node5x1y node6x1y) (connection node5x5y node6x5y) (connection node5x6y node6x6y)
 (connection node6x0y node7x0y) (connection node6x1y node7x1y) (connection node6x3y node7x3y) (connection node6x5y node7x5y) (connection node6x6y node7x6y)
 (connection node7x0y node8x0y) (connection node7x1y node8x1y) (connection node7x2y node8x2y) (connection node7x3y node8x3y) (connection node7x4y node8x4y) (connection node7x5y node8x5y) (connection node7x6y node8x6y)
 
 ;moving down
 (connection node1x0y node0x0y) (connection node1x1y node0x1y) (connection node1x2y node0x2y) (connection node1x3y node0x3y) (connection node1x4y node0x4y) (connection node1x5y node0x5y) (connection node1x6y node0x6y)
 (connection node2x0y node1x0y) (connection node2x1y node1x1y) (connection node2x3y node1x3y) (connection node2x5y node1x5y) (connection node2x6y node1x6y)
 (connection node3x0y node2x0y) (connection node3x1y node2x1y) (connection node3x5y node2x5y) (connection node3x6y node2x6y)
 (connection node4x0y node3x0y) (connection node4x1y node3x1y) (connection node4x5y node3x5y) (connection node4x6y node3x6y)
 (connection node5x0y node4x0y) (connection node5x1y node4x1y) (connection node5x5y node4x5y) (connection node5x6y node4x6y)
 (connection node6x0y node5x0y) (connection node6x1y node5x1y) (connection node6x5y node5x5y) (connection node6x6y node5x6y)
 (connection node7x0y node6x0y) (connection node7x1y node6x1y) (connection node7x3y node6x3y) (connection node7x5y node6x5y) (connection node7x6y node6x6y)
 (connection node8x0y node7x0y) (connection node8x1y node7x1y) (connection node8x2y node7x2y) (connection node8x3y node7x3y) (connection node8x4y node7x4y) (connection node8x5y node7x5y) (connection node8x6y node7x6y)

 ;moving right
 (connection node0x0y node0x1y) (connection node0x1y node0x2y) (connection node0x2y node0x3y) (connection node0x3y node0x4y) (connection node0x4y node0x5y) (connection node0x5y node0x6y)
 (connection node1x0y node1x1y) (connection node1x1y node1x2y) (connection node1x2y node1x3y) (connection node1x3y node1x4y) (connection node1x4y node1x5y) (connection node1x5y node1x6y)
 (connection node2x0y node2x1y) (connection node2x5y node2x6y)
 (connection node3x0y node3x1y) (connection node3x5y node3x6y)
 (connection node4x0y node4x1y) (connection node4x1y node4x2y) (connection node4x4y node4x5y) (connection node4x5y node4x6y)
 (connection node5x0y node5x1y) (connection node5x5y node5x6y)
 (connection node6x0y node6x1y) (connection node6x5y node6x6y)
 (connection node7x0y node7x1y) (connection node7x1y node7x2y) (connection node7x2y node7x3y) (connection node7x3y node7x4y) (connection node7x4y node7x5y) (connection node7x5y node7x6y)
 (connection node8x0y node8x1y) (connection node8x1y node8x2y) (connection node8x2y node8x3y) (connection node8x3y node8x4y) (connection node8x4y node8x5y) (connection node8x5y node8x6y)

  ;moving left
  (connection node0x1y node0x0y) (connection node0x2y node0x1y) (connection node0x3y node0x2y) (connection node0x4y node0x3y) (connection node0x5y node0x4y) (connection node0x6y node0x5y)
 (connection node1x1y node1x0y) (connection node1x2y node1x1y) (connection node1x3y node1x2y) (connection node1x4y node1x3y) (connection node1x5y node1x4y) (connection node1x6y node1x5y)
 (connection node2x1y node2x0y) (connection node2x6y node2x5y)
 (connection node3x1y node3x0y) (connection node3x6y node3x5y)
 (connection node4x1y node4x0y) (connection node4x2y node4x1y) (connection node4x5y node4x4y) (connection node4x6y node4x5y)
 (connection node5x1y node5x0y) (connection node5x6y node5x5y)
 (connection node6x1y node6x0y) (connection node6x6y node6x5y)
 (connection node7x1y node7x0y) (connection node7x2y node7x1y) (connection node7x3y node7x2y) (connection node7x4y node7x3y) (connection node7x5y node7x4y) (connection node7x6y node7x5y)
 (connection node8x1y node8x0y) (connection node8x2y node8x1y) (connection node8x3y node8x2y) (connection node8x4y node8x3y) (connection node8x5y node8x4y) (connection node8x6y node8x5y)

)

(:goal (and
   (missioncomplete)
))

;un-comment the following line if metric is needed
(:metric minimize (total-cost)
)
)
