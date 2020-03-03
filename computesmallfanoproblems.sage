def cached_binomial(n, k, cache={}):
    if (n, k) not in cache:
        cache[n, k] = binomial(n, k)
    return cache[n, k]
#cached binomial for speed

import itertools
with open("smallfanoexceptions.txt","w") as f: 
	for r in range(1,3):
		for n in range(1,10):
			print n
			RHS = (n-r)*(r+1)
			if n < 8:
				srange = n
			else:
				srange = n-3
			for s in range(srange):
				print s
				for tup in itertools.product(range(2, 2*n), repeat=s):
					S = sum(cached_binomial(tup[i]+r,r) for i in range(len(tup)))
					if S == RHS:
						ans = (tup,r,n)
						f.write(str(ans))
#2n-r \geq (di+1 )*s \geq s*3 so for n at least 8 we have
#2n - 2 = 14
#and s can't be more than n-3, this speeds up the n = 8 and 9 cases