source('../calc_evolution.r')

library(animation)

### Examples ###

#input for example 1
G1 = 2*10^8 #m^2/s
G2 = -3*10^8
G3 = 6*10^8
r1 = c(1,0)*10^6 #m
r2 = c(0.5,1)*10^6
r3 = c(0,0)*10^6
N=10*24*60*60
circ=c(G1,G2,G3)

#input for example 2
G1 = 6*10^8 #m^2/s
G2 = 6*10^8
G3 = 6*10^8
r1 = c(1,0)*10^6 #m
r2 = c(0.5,1)*10^6
r3 = c(0,0)*10^6
N=1*24*60*60
circ=c(G1,G2,G3)

#input for example 3
G1 = 6*10^8 #m^2/s
G2 = 6*10^8
G3 = -3*10^8
r1 = c(1,0)*10^6 #m
r2 = c(0,1)*10^6
r3 = c(0,0)*10^6
N=10*24*60*60
circ=c(G1,G2,G3)

#add further examples
#...



### calculate time evolution ###
orte = evolution(circ,r1,r2,r3,N)

#center of circulation
rs=c(r1[1],r2[1],r3[1])
center = c(sum(circ%*%rs), sum(circ%*%rs))/sum(circ)/1000 #km

#plot
orte=orte/1000 #km
plot(orte[,1],orte[,2],col='orange',type='l',lwd=2,xlim=c(min(orte[,1],orte[,3],orte[,5],na.rm=T),max(orte[,1],orte[,3],orte[,5],na.rm=T)),ylim=c(min(orte[,2],orte[,4],orte[,6],na.rm=T),max(orte[,2],orte[,4],orte[,6],na.rm=T)),main = paste0('three point vortices in a plane (duration: ',N/(24*3600),' d)'),xlab='x [km]',ylab='y [km]')
points(orte[,3],orte[,4],col=4,type='l',lwd=2)
points(orte[,5],orte[,6],col='green3',type='l',lwd=2)
points(orte[1,1],orte[1,2],col='orange',cex=2,pch=16)
points(orte[1,3],orte[1,4],col=4,cex=2,pch=16)
points(orte[1,5],orte[1,6],col='green3',cex=2,pch=16)
grid()
points(center,lwd=2,pch=3)
legend('bottomright',legend=c('center',paste0('Vortex 1 (G: ', G1*10^-8,')'),paste0('Vortex 2 (G: ', G2*10^-8,')'),paste0('Vortex 3 (G: ', G3*10^-8,')')), col=c(1,'orange',4,'green3'),pch=c(3,16,16,16),bg='white')





### example for creating an animation ###
saveVideo({
	for (i in c(1,N/(20:1))) {
		plot(orte[1:i,1],orte[1:i,2],col=2,type='l',lwd=2,xlim=c(min(orte[,1],orte[,3],orte[,5],na.rm=T),max(orte[,1],orte[,3],orte[,5],na.rm=T)),ylim=c(min(orte[,2],orte[,4],orte[,6],na.rm=T),max(orte[,2],orte[,4],orte[,6],na.rm=T)),main = '3 point vortices in a plane',xlab='x',ylab='y')
		points(orte[1:i,3],orte[1:i,4],col=4,type='l',lwd=2)
		points(orte[1:i,5],orte[1:i,6],col='orange',type='l',lwd=2)
		points(orte[1,1],orte[1,2],col=2,cex=2,pch=16)
		points(orte[1,3],orte[1,4],col=4,cex=2,pch=16)
		points(orte[1,5],orte[1,6],col='orange',cex=2,pch=16)
		grid()
	}
})

