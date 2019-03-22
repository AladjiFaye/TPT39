__kernel void matrix_mult(__global const float *x,
                        __global const float *y,
                        __global float *restrict z,
                        const int number)
//number : number of columns
{
  //https://cnugteren.github.io/tutorial/pages/page3.html
  int row = get_global_id(0);
  int col = get_global_id(1);
  int N = number;
  z[row*N + col] = 0;
  for (unsigned i = 0; i < N; i++) {
    z[row*N + col] += x[row*N + i] * y[i*N+col];
  }
}
