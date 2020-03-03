def fanodegKron(e):
	R = PolynomialRing(Integers(4),'t',sparse = True) 
	exp= 15+e*15+e^2*15+e^3*15+e^4*15+e^5*15+15*e^6
	s= R.gen() 
	nums = range(3+1)
	qfacts = Tuples(nums,7+1)
	qfacts = [L for L in qfacts if sum(L) == 3] #create all lists of 8 numbers which sum to 3
	v = [1,s, (s^e), s^(e^2), s^(e^3), s^(e^4), s^(e^5), s^(e^6)] #e= 24 in our case, this applies Kronecker substitution to make Q into a linear polynomial
	Q=1
	for (i,q) in enumerate(qfacts):
		print i
		Q = Q*sum(a*b for (a,b) in zip(v,q)) #build the polynomial
		Q = Q.truncate(exp+1)
	vand = [(i,j) for i in range(8) for j in range(8) if i < j < 8] #create the varndermonde polynomial indices
	Vr = 1
	for (k,(i,j)) in enumerate(vand):
		print k
		if i == 0:
			Vr = Vr* (1 - v[j])
		else:
			Vr = Vr* (1 - s^(e^(j-1) -e^(i-1)))
	coeff = 0
	for i in xrange(exp+1):
		q=Q[exp - i]
		sgn = Vr[i]
		coeff += q*sgn
	return coeff
with open("theanswermod4.txt","w") as f: 
    f.write(str(fanodegKron(24)))
#this code computes F_7(X_3) mod 4