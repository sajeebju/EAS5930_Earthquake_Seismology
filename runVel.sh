#!/bin/bash
cd ML

for i in ../GroundVel/*H[NE12]*SAC.vel; do
    B=$(basename $i .vel)
    gsac << EOF
    r $i
    rtr
    transfer from none to polezero subtype wa.pz
    mul 1.0e+9
    w ${B}.wa
    q
EOF
done

