#!/usr/bin/gnuplot -persist

load "engine_cuda.plt"

unset title

# set title "Encryption performance AES-ECB" 
set output "ecb-encrypt_aes.pdf"
plot 'plot-data/aes-128-ecb_gpu_cudamrg.dat' using ($2/1048576) title 'AES-128 CUDA' with linespoints, \
     'plot-data/aes-192-ecb_gpu_cudamrg.dat' using ($2/1048576) title 'AES-192 CUDA' with linespoints, \
     'plot-data/aes-256-ecb_gpu_cudamrg.dat' using ($2/1048576) title 'AES-256 CUDA' with linespoints, \
     'plot-data/aes-128-ecb_gpu_opencl.dat' using ($2/1048576) title 'AES-128 OpenCL' with linespoints, \
     'plot-data/aes-192-ecb_gpu_opencl.dat' using ($2/1048576) title 'AES-192 OpenCL' with linespoints, \
     'plot-data/aes-256-ecb_gpu_opencl.dat' using ($2/1048576) title 'AES-256 OpenCL' with linespoints, \
     'plot-data/aes-128-ecb_cpu.dat' using ($2/1048576) title 'AES-128 CPU' with linespoints, \
     'plot-data/aes-192-ecb_cpu.dat' using ($2/1048576) title 'AES-192 CPU' with linespoints, \
     'plot-data/aes-256-ecb_cpu.dat' using ($2/1048576) title 'AES-256 CPU' with linespoints

# set title "Encryption performance Blowfish-ECB" 
set output "ecb-encrypt_bf.pdf"
plot 'plot-data/bf-ecb_gpu_cudamrg.dat' using ($2/1048576) title 'Blowfish CUDA' with linespoints, \
     'plot-data/bf-ecb_gpu_opencl.dat' using ($2/1048576) title 'Blowfish OpenCL' with linespoints, \
     'plot-data/bf-ecb_cpu.dat' using ($2/1048576) title 'Blowfish CPU' with linespoints

# set title "Encryption performance CAST5-ECB" 
set key inside left top vertical Right autotitles width 3 box linetype 1 linewidth 1.000
set output "ecb-encrypt_cast5.pdf"
plot 'plot-data/cast5-ecb_gpu_cudamrg.dat' using ($2/1048576) title 'CAST5 CUDA' with linespoints, \
     'plot-data/cast5-ecb_gpu_opencl.dat' using ($2/1048576) title 'CAST5 OpenCL' with linespoints, \
     'plot-data/cast5-ecb_cpu.dat' using ($2/1048576) title 'CAST5 CPU' with linespoints

# set title "Encryption performance DES-ECB" 
set output "ecb-encrypt_des.pdf"
plot 'plot-data/des-ecb_gpu_cudamrg.dat' using ($2/1048576) title 'DES CUDA' with linespoints, \
     'plot-data/des-ecb_gpu_opencl.dat' using ($2/1048576) title 'DES OpenCL' with linespoints, \
     'plot-data/des-ecb_cpu.dat' using ($2/1048576) title 'DES CPU' with linespoints

# set title "Encryption performance IDEA-ECB" 
set output "ecb-encrypt_idea.pdf"
plot 'plot-data/idea-ecb_gpu_cudamrg.dat' using ($2/1048576) title 'IDEA CUDA' with linespoints, \
     'plot-data/idea-ecb_gpu_opencl.dat' using ($2/1048576) title 'IDEA OpenCL' with linespoints, \
     'plot-data/idea-ecb_cpu.dat' using ($2/1048576) title 'IDEA CPU' with linespoints

# set title "Encryption performance Camellia-ECB" 
set output "ecb-encrypt_camellia-128.pdf"
plot 'plot-data/camellia-128-ecb_gpu_cudamrg.dat' using ($2/1048576) title 'Camellia CUDA' with linespoints, \
     'plot-data/camellia-128-ecb_gpu_opencl.dat' using ($2/1048576) title 'Camellia OpenCL' with linespoints, \
     'plot-data/camellia-128-ecb_cpu.dat' using ($2/1048576) title 'Camellia CPU' with linespoints

set terminal pdf size 15cm,12cm font "Palatino"
unset title
#set title "Encryption performance with ECB (CUDA)" 
set output "ecb-encrypt_cuda.pdf"
plot 'plot-data/aes-128-ecb_gpu_cudamrg.dat' using ($2/1048576) title 'AES-128 GPU' with linespoints, \
     'plot-data/aes-128-ecb_cpu.dat' using ($2/1048576) title 'AES-128 CPU' with linespoints, \
     'plot-data/bf-ecb_gpu_cudamrg.dat' using ($2/1048576) title 'Blowfish GPU' with linespoints, \
     'plot-data/bf-ecb_cpu.dat' using ($2/1048576) title 'Blowfish CPU' with linespoints, \
     'plot-data/idea-ecb_gpu_cudamrg.dat' using ($2/1048576) title 'IDEA GPU' with linespoints, \
     'plot-data/idea-ecb_cpu.dat' using ($2/1048576) title 'IDEA CPU' with linespoints, \
     'plot-data/des-ecb_gpu_cudamrg.dat' using ($2/1048576) title 'DES GPU' with linespoints, \
     'plot-data/des-ecb_cpu.dat' using ($2/1048576) title 'DES CPU' with linespoints, \
     'plot-data/cast5-ecb_gpu_cudamrg.dat' using ($2/1048576) title 'CAST5 GPU' with linespoints, \
     'plot-data/cast5-ecb_cpu.dat' using ($2/1048576) title 'CAST5 CPU' with linespoints, \
     'plot-data/camellia-128-ecb_gpu_cudamrg.dat' using ($2/1048576) title 'Camellia 128 GPU' with linespoints, \
     'plot-data/camellia-128-ecb_cpu.dat' using ($2/1048576) title 'Camellia 128 CPU' with linespoints

#set title "Encryption performance with ECB (OpenCL)" 
unset title
set output "ecb-encrypt_opencl.pdf"
plot 'plot-data/aes-128-ecb_gpu_opencl.dat' using ($2/1048576) title 'AES-128 GPU' with linespoints, \
     'plot-data/aes-128-ecb_cpu.dat' using ($2/1048576) title 'AES-128 CPU' with linespoints, \
     'plot-data/bf-ecb_gpu_opencl.dat' using ($2/1048576) title 'Blowfish GPU' with linespoints, \
     'plot-data/bf-ecb_cpu.dat' using ($2/1048576) title 'Blowfish CPU' with linespoints, \
     'plot-data/idea-ecb_gpu_opencl.dat' using ($2/1048576) title 'IDEA GPU' with linespoints, \
     'plot-data/idea-ecb_cpu.dat' using ($2/1048576) title 'IDEA CPU' with linespoints, \
     'plot-data/des-ecb_gpu_opencl.dat' using ($2/1048576) title 'DES GPU' with linespoints, \
     'plot-data/des-ecb_cpu.dat' using ($2/1048576) title 'DES CPU' with linespoints, \
     'plot-data/cast5-ecb_gpu_opencl.dat' using ($2/1048576) title 'CAST5 GPU' with linespoints, \
     'plot-data/cast5-ecb_cpu.dat' using ($2/1048576) title 'CAST5 CPU' with linespoints, \
     'plot-data/camellia-128-ecb_gpu_opencl.dat' using ($2/1048576) title 'Camellia 128 GPU' with linespoints, \
     'plot-data/camellia-128-ecb_cpu.dat' using ($2/1048576) title 'Camellia 128 CPU' with linespoints

# set title "IDEA ECB (CUDA)" 
set output "idea_mul_umul.pdf"
plot 'plot-data/idea-ecb_32bit_mul.dat' using ($2/1048576) title 'IDEA: a*b' with linespoints lw 2, \
     'plot-data/idea-ecb_32bit_umul.dat' using ($2/1048576) title 'IDEA: __umul24(a,b)' with linespoints lw 2

set output "idea_multi_block.pdf"
set terminal pdf size 15cm,8cm font "Palatino"
set key inside right bottom vertical Right noreverse enhanced autotitles box linetype 1 linewidth 1.000
plot 'plot-data/idea-ecb_single_block.dat' using ($2/1048576) title 'IDEA (regular)' with linespoints lw 2, \
     'plot-data/idea-ecb_two_blocks.dat' using ($2/1048576) title 'IDEA (two blocks)' with linespoints lw 2, \
     'plot-data/idea-ecb_two_blocks_maxreg.dat' using ($2/1048576) title 'IDEA (two blocks, maxreg=10)' with linespoints lw 2, \
     'plot-data/idea-ecb_four_blocks.dat' using ($2/1048576) title 'IDEA (four blocks)' with linespoints lw 2,\
     'plot-data/idea-ecb_four_blocks_maxreg.dat' using ($2/1048576) title 'IDEA (four blocks, maxreg=10)' with linespoints lw 2

unset title
set output "idea_schedule.pdf"
set terminal pdf size 15cm,8cm font "Palatino"
plot 'plot-data/idea-ecb_yield.dat' using ($2/1048576) title 'IDEA: yield' with linespoints lw 2, \
     'plot-data/idea-ecb_spin.dat' using ($2/1048576) title 'IDEA: spin' with linespoints lw 2

unset title
set output "cuda_blocks.pdf"
set terminal pdf size 15cm,8cm font "Palatino"
unset xtics
set yrange[0:*]
set style data histogram
set style histogram cluster gap 1
set style fill solid border -1
set boxwidth 0.9
set xtic rotate by -45 scale 0
unset xlabel
plot 'plot-data/speed_blocks.dat' using ($2/1048576):xtic(1) title '128 threads', '' using ($3/1048576):xtic(1) title '256 threads'
