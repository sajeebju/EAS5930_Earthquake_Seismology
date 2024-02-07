#!/bin/bash

cd GroundVel

for i in ../Sac/*SAC; do
    B=$(basename ${i})
    gsac << EOF
    r $i
    rtr
    taper w 0.05
    transfer from polezero subtype ${i}.pz to VEL  freqlimits 0.005 0.01 20 40
    div 1.0e+9
    w  ${B}.vel
    q
EOF
done

