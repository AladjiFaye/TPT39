__kernel void vector_average(__global const float *x,
                        __global float restrict z)
{
  z += 0.5*x[get_global_id(0)];
}
