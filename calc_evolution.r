### Simulating 3 point vortices in a plane described by Helmholtz (1858) equations ###
NULL


#' Helmholtz equation for x coordinate
#'
#' @description time evolution x coordinate
#' @param xj x coordinate of the j-th vortex
#' @param yj y coordinate of the j-th vortex
#' @param x1 x coordinate of the first vortex
#' @param y1 y coordinate of the first vortex
#' @param x2 x coordinate of the second vortex
#' @param y2 y coordinate of the second vortex
#' @param G1 circulation of the first vortex
#' @param G1 circulation of the second vortex
dxj_dt = function(xj,yj,x1,y1,x2,y2,G1,G2) {
	r_1j = (xj-x1)^2+(yj-y1)^2
	r_2j = (xj-x2)^2+(yj-y2)^2
	dist = c(r_1j,r_2j)
	circ = c(G1,G2)
	ys = c(y1,y2)
	return(-1/(2*pi)*sum(circ*((yj-ys)/dist)))
}

#' Helmholtz equation for y coordinate
#'
#' @description time evolution x coordinate
#' @param xj x coordinate of the j-th vortex
#' @param yj y coordinate of the j-th vortex
#' @param x1 x coordinate of the first vortex
#' @param y1 y coordinate of the first vortex
#' @param x2 x coordinate of the second vortex
#' @param y2 y coordinate of the second vortex
#' @param G1 circulation of the first vortex
#' @param G1 circulation of the second vortex
dyj_dt = function(xj,yj,x1,y1,x2,y2,G1,G2) {
	r_1j = (xj-x1)^2+(yj-y1)^2
	r_2j = (xj-x2)^2+(yj-y2)^2
	dist = c(r_1j,r_2j)
	circ = c(G1,G2)
	xs = c(x1,x2)
	return(1/(2*pi)*sum(circ*((xj-xs)/dist)))
}


#' Simple integration scheme
#'
#' @description forward time integration (simple)
#' @param circ vector of length 3 containing the circulations of the 3 point vortices
#' @param r1 vector of length 2 containing the coordinates (x,y) of the first vortex
#' @param r2 vector of length 2 containing the coordinates (x,y) of the second vortex
#' @param r3 vector of length 2 containing the coordinates (x,y) of the third vortex
#' @param N number of steps
evolution = function(circ,r1,r2,r3,N) {
	orte = matrix(NA,nrow=N,ncol=6) #cols x1,y1,x2,y2,x3,y3
	orte[1,c(1,2)] = r1
	orte[1,c(3,4)] = r2
	orte[1,c(5,6)] = r3
	for (i in 2:N) {
		#x1
		orte[i,1] = orte[i-1,1] + dxj_dt(orte[i-1,1],orte[i-1,2],orte[i-1,3], orte[i-1,4],orte[i-1,5], orte[i-1,6], circ[2],circ[3])
		#y1
		orte[i,2] = orte[i-1,2] + dyj_dt(orte[i-1,1],orte[i-1,2],orte[i-1,3], orte[i-1,4],orte[i-1,5], orte[i-1,6], circ[2],circ[3])
		#x2
		orte[i,3] = orte[i-1,3] + dxj_dt(orte[i-1,3],orte[i-1,4],orte[i-1,1], orte[i-1,2],orte[i-1,5], orte[i-1,6], circ[1],circ[3])
		#y2
		orte[i,4] = orte[i-1,4] + dyj_dt(orte[i-1,3],orte[i-1,4],orte[i-1,1], orte[i-1,2],orte[i-1,5], orte[i-1,6], circ[1],circ[3])
		#x3
		orte[i,5] = orte[i-1,5] + dxj_dt(orte[i-1,5],orte[i-1,6],orte[i-1,3], orte[i-1,4],orte[i-1,1], orte[i-1,2], circ[2],circ[1])
		#y3
		orte[i,6] = orte[i-1,6] + dyj_dt(orte[i-1,5],orte[i-1,6],orte[i-1,3], orte[i-1,4],orte[i-1,1], orte[i-1,2], circ[2],circ[1])
	}
	return(orte)
}


#' here you can add more advanced integration schemes, like RK4, and compare the obtained results
#' ...
