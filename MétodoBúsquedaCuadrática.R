

#Metodo de busqueda lineal de ajuste cuadratico
#Escribe la funci??n objetivo dentro de los parentesis de f
#Escribe el intervalo inial (a,b)
#Escribe la tolerancia

f<-function(x){(x-4)^2 +x/2}
a<- -1
b<- 10
e<-0.001

#Se calculan las lambdas y se eval??an en la funci??n
lambda1<- a+((b-a)/5)
lambda2<-a+(2*(b-a)/5)
lambda3<-a+(3*(b-a)/5)
f1<-f(lambda1)
f2<-f(lambda2)
f3<-f(lambda3)

#Se inicial el ciclo del algoritmo
k<-0
while((lambda3-lambda1)> e){
lambdabarra<-runif(1,lambda1,lambda3) 
  
if(lambdabarra>lambda2) { 
    if(f(lambdabarra)>f(lambda2)){
      lambda3<-lambdabarra
    }else if(f(lambdabarra)<=f(lambda2)){
    lambda1<-lambda2
    lambda2<-lambdabarra
    }
    
  } else{
    if(f(lambdabarra)>f(lambda2)){lambda1<-lambdabarra
    }else if(f(lambdabarra)<=f(lambda2)){
    lambda3<-lambda2
    lambda2<-lambdabarra
    }
  }
 
   
  k=k+1
}
Punto.Optimo<-(lambda3+lambda1)/2

