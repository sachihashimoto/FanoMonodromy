#when e is at least 20, this computes F_6(X_3)

def fanodegK(e):
	R.<t> = PowerSeriesRing(ZZ,17+e*16+e^2*15+e^3*14+e^4*13+e^5*12)
	s= R.gen()
	nums = range(3+1)
	qfacts = Tuples(nums,6+1).list()
	qfacts = [L for L in qfacts if sum(L) == 3]
	v = [1,s, (s^e), s^(e^2), s^(e^3), s^(e^4), s^(e^5)] #solve for e
	Q=1
	for (i,l) in enumerate(qfacts):
		Q = Q*sum(a*b for (a,b) in zip(v,l))
		print i
	vand = [(i,j) for i in range(8) for j in range(8) if i < j < 8]
	Vr = 1
	for (k,(i,j)) in enumerate(vand):
		Vr = Vr * (v[i] - v[j])
		print k
	return (Q*Vr)[17+e*16+e^2*15+e^3*14+e^4*13+e^5*12]

#a*1+be+ce^2+de^3+f*e^4+ge^5 = 17+e*16+e^2*15+e^3*14+e^4*13+e^5*12 not possible
#for a+b+c+d+f+g less than or equal to 105
#need to start with (17 + 16 +15+ 14+ 13+12) - #carrys +e*#carrys
# 87 + carrys (e-1) less than or equal to 105
#carrys (e-1) \leq 18
# so then e geq 20 will do