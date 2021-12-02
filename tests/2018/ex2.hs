distancia :: Floating a => (a,a) -> (a,a) -> a
distancia (x1,y1) (x2,y2) = sqrt (((x2-x1)^2) + ((y2-y1)^2))

declive (x1,y1) (x2,y2) = (y1-y2)/(x1-x2)

colineares (x1,y1) (x2,y2) (x3,y3) = declive (x1,y1) (x2,y2) == declive (x2,y2) (x3,y3)
