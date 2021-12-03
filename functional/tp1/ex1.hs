testaTriangulo :: Float -> Float -> Float -> Bool
testaTriangulo a b c = largest < sum [a, b, c] - largest
  where largest = max (max a b) c

testaTriangulo' :: Float -> Float -> Float -> Bool
testaTriangulo' a b c = (a+b > c) && (a+c > b) && (b+c > a)
