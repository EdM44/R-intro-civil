#' ---
#' title: "Lab 1 - calculating friction factors"
#' author: "Fulano Zutano"
#' date: "February 8, 2019"
#' ---

#' Input Constants for first part - SI units
rho <- 1000.0    #kg/m^3
mu <- 0.001      #dynamic viscosity Ns/m^2
nu <- mu/rho     #kinematic viscosity m^2/s
ks <- 0.00012    #absolute roughness meter
D <- 0.2         #diameter meter
Q <- 0.05        #flow m^3/s

#' Functions Used
# Velocity Function
velocity <- function ( diameter , discharge ){
  velocity <- discharge /(0.25* pi* diameter ^2)
  return ( velocity )
}
# Reynolds Number Function
reynolds_number <- function ( velocity , diameter ,nu){
  reynolds_number <- abs ( velocity )* diameter /nu
  return ( reynolds_number )
}
# Haaland equation function
haaland <- function (ks,D,Re){
  invF <- -1.8*log10(((ks/D)/3.7)^1.11+(6.9/Re))
  return((1/invF)^2)
}

#' Perform Calculations
V <- velocity(D,Q)
Re <- reynolds_number(V,D,nu)
f_haaland <- haaland(ks,D,Re)

#print results
cat(sprintf("Haaland f: %.4f\n", f_haaland))
