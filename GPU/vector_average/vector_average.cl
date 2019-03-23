__kernel void vector_average(__global const float *x,
                        float z)
{
  z += 0.5*x[get_global_id(0)];
}
