iterate' f n = n : iterate' f (f n)
