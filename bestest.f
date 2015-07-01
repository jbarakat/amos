      program bestest
      integer nz,ierr
      double precision zr,zi,cyr,cyi
      external zbesj
      dimension cyr(4),cyi(4)
      zr=0.1d0
      zi=0.2d0
      call zbesj(zr,zi,0.0d0,1,1,cyr,cyi,nz,ierr)
      print *, cyr(1),cyi(1)
      end program
