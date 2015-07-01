#include <stdio.h>
#include <complex.h>

extern "C" void zbesj_(double*, double*, double*, int*, int*, double*, double*, int*, int*);

//double complex * jarray();

double complex besselj(double nu, double complex z){
  int kode=1;
  int n=1;
  double zr=creal(z);
  double zi=cimag(z);
  int nz,ierr;
  double cyr[1],cyi[1];
  double complex res;
  zbesj_(&zr,&zi,&nu,&kode,&n,cyr,cyi,&nz,&ierr);
  if(ierr!=0){
    printf("error!\n");
  }
  res=cyr[0]+I*cyi[0];
  return res;
}

int main(void){
  double complex J0 = besselj(0.0,0.1+0.2*I);
  printf("\nJ0(0.1+0.2i)= %.17f  %+.17f I\n",creal(J0),cimag(J0));

	return 0;
}
