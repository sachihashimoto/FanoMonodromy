def fanoDegree(d,r,n):
	R = PolynomialRing(ZZ,r+1,var_array=['x'])
	var=list(R.gens())
	Qlist = []
	for di in d:
		nums = range(di+1)
		monos = Tuples(nums,r+1).list()
		monos = [x for x in monos if sum(x) == di]
		mlist=[]
		Q= 1
		for (i,m) in enumerate(monos):
			l = [a*b for (a,b) in zip(var,m)]
			Q=Q *(sum(l))
		Qlist.append(Q)
	Q=1
	for q in Qlist:
		Q=Q*q
	Vk = 1
	vand = [(i,j) for i in range(r+1) for j in range(r+1) if i < j < r+1]
	for (i,j) in vand:
		Vk = Vk * (var[i] - var[j])
	coeff=[]
	for i in range(r+1):
		coeff.append(n-i)
	cd = {var[i]:coeff[i] for i in range(r+1)}
	print (Q*Vk).coefficient(cd)
#this code will compute fano degrees for reasonably small fano problems
#runs the naive method of applying Debarre-Manivel, not the Kronecker substitution