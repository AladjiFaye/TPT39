__kernel void convolution(__global const float *input,
                        __global float *output,
                        __global const float *filter,
                        const int M, const int N)
//M,N : size of matrix
{
//https://www.evl.uic.edu/kreda/gpu/image-convolution/
//https://stackoverflow.com/questions/26681713/convert-mat-to-array-vector-in-opencv
//2 dimensions for clEnqueueNDRangeKernel


  int i = get_global_id(0); //row
  int j = get_global_id(1); //col
  output[i*N+j] = 128;
  for (int k = -1; k < 2; k++) {
    for (int l = -1; l < 2; l++) {
      //padding at 0 by default
      if (i+k>=0 && i+k<M && j+l>=0 && j+l<N) {
        output[i*N+j]+=filter[(k+1)*3+(l+1)]*input[(i+k)*N+j+l];
      //  printf("%d %d %d %f %f\n",i,j,(i+k)*N+j+l, output[i*N+j],input[i*N+j]);
      }
    }
  }

}
