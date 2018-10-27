from sage.schemes.riemann_surfaces.riemann_surface import RiemannSurface, RiemannSurfaceSum
R.<x,y> = QQ[]


#import sys
#sys.stdout = open('output.txt','wt')


magma.AttachSpec("~/endomorphisms/endomorphisms/magma/spec")

#genus 3 dummy
#f1 = y^2 - (x^8 + 2*x^6 + 4*x^4 + 6*x^2 + 8)
#f2 = y^3-(x^4-1)
#f2 = y^4-(x^2 - 1)*(x^2 - 2^3)
#f2 = y^4-(x^2 - 1)*(x^2 + 2)^3
#f2 = y^6 - (x+1)*x^3*(x-1)^5

#genus 4 dummy
#f1 = y^2 - (x^10 + 2*x^8 + 4*x^6 + 6*x^4 + 8*x^2 + 10)
#f2 = y^12 - x*(x-1)^7
#f2 = y^3 - x*(x^4 - 1)
#f2 = y^5 - x*(x - 1)^2*(x + 1)^3
#y^2 - (4*x^3 - 75*x - 1475)
#y^5 - (x+1)*x^2*(x-1)^{-1} #x*(x - 1)^2*(x + 1)^4  

#genus 5 dummy
f1 = y^2 - (x^12 + 2*x^10 + 4*x^8 + 6*x^6 + 8*x^4 + 10*x^2 + 12)
#f2 = y^8 - x^2*(x^2 - 1)
#f2 = y^6 - (x^2 - 1)*(x^2 - 2)^3
#f2 = y^6 - x^4*(x^2 - 1)^2*(x - 2) #7 is arbitrary
f2 = y^6 - x*(x-1)^2*(x-2)^2*(x-3)^3*(x-4)^4 

S1 = RiemannSurface(f1, prec = 100)
S2 = RiemannSurface(f2, prec = 100)



def check_order(L):
  ree = []
  for l in L: 
     for n in range(1,145): 
        if l^n == matrix.identity(6):
           #print l
           #ree.append([n, l])
           ree.append(n)
           break
        else:
           pass
  #print ree
  #print sorted(ree)
  print [[x,ree.count(x)] for x in set(ree)]
  


T = RiemannSurfaceSum([ S1 ])
# Any matrix goes here where S2.riemann_matrix() is used.
# Just take care to make the genera compatible.
T.tau = S2.riemann_matrix()
G2 = T.symplectic_automorphism_group()
print G2.order()
#print G2.order()
print G2.gens()[0:15]
#check_order(G2.gens())
