#!/bin/sh


#####
#       define the color palete for elevation
#       MIN_ELV R G B MAX_ELEV R G B
#       (from Chuck Ammon)
#####
cat > map.cpt << EOF
-1000   100     200     255     -500    100     200     255
-500    150     225     255     0       150     225     255
0       100     150     100     30      100     150     100
30      125     175     125     60      125     175     125
60      150     200     150     122     150     200     150
122     175     225     175     183     175     225     175
183     200     255     200     244     200     255     200
244     212     255     212     305     212     255     212
305     255     255     225     457     255     255     225
457     255     225     175     610     255     225     175
610     255     225     125     702     255     225     125
702     255     175     75      914     255     175     75
914     200     150     50      1219    200     150     50
1219    175     125     50      1450    175     125     50
1450    150     100     50      1700    150     100     50
1700    150     125     100     1981    150     125     100
1981    125     125     125     2134    125     125     125
2134    150     150     150     2438    150     150     150
2438    175     175     175     2743    175     175     175
2743    200     200     200     3048    200     200     200
3048    233     233     233     9000    233     233     233
B       100     200     255
F       100     200     255
EOF

#####
#    set GMT defaults
#####
# Output format in longitude [-180, 180] 
# with two decimal points. For more precision used ddd.xxx,
# for less ddd
# If you do not get a good conversion to PNG, the EPS BoundingBox is wrong.
# Is is set for a4 paper. change the PS_MEDIA or PS_SCALE_X PS_SCALE_Y
gmt gmtset MAP_FRAME_TYPE FANCY FORMAT_GEO_MAP ddd.xx  PROJ_LENGTH_UNIT c PS_MEDIA a4 PS_SCALE_X 0.8 PS_SCALE_Y 0.8 

#####
#    Define the default name of the PostScript output
#####
FNAME="map5.eps"


#####
#    Define map bounds: MINLON/MAXLON/MINLAT/MAXLAT 
#####
LATLON="-107.829262/-96.970947/32.969601/41.945099"

#####
#    Define raster for topography:  
#####
GRDRAS="1"

#####
#    Define Mercalli projection: Center_lon/Center_Lat/Plot_Width   
#####
PROJ="M-102.400101/37.457352/15c"
rm -f ${FNAME}

#####
#    Define Coastline resolution: one of fhilc 
#    (f)ull, (h)igh, (i)ntermediate, (l)ow, and (c)rude)
#  . The resolution drops off by 80% between data sets.
#####
RESCOAST="i"

#####
#    Define Ticmark interval 
#####
TICS="a5.000000g0/a2.000000g0WSne"

#####
#    Define epicenter symbol and size  
#####
EPISYM="A0.50c"
EPICOLOR="255/255/0"

#####
#    Define station symbol and size  
#####
STASYM="c0.37c"
STACOLOR="255/0/0"

#####
#    Define boundaries for pscoast 
#    1 = National boundaries 
#    2 = State boundaries within the Americas 
#    3 = Marine boundaries 
#    a = All boundaries (1-3) pscoast 
#####
BDRYS="a"

#####
#    Define resolution for output of grdsample 
#####
RESOUT="2m"

gmt pscoast -P -W  -J${PROJ} -R${LATLON} -B${TICS} -G240  -K  -N${BDRYS} -D${RESCOAST} -A2500  -V   > ${FNAME}

#####
#    PLOT EPICENTER LOCATIONS
#####
gmt psxy -P -J${PROJ} -R${LATLON} -O -: -S${EPISYM} -W0.8 -G${EPICOLOR} -V -K   >> ${FNAME} << EOF
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
37.358898 -102.845299
EOF


#####
#    PLOT STATION LOCATIONS
#####
gmt psxy -P -J${PROJ} -R${LATLON} -O -: -S${STASYM} -W0.8 -G${STACOLOR} -V -K >> ${FNAME} << EOF
40.446465 -104.638214
40.446465 -104.638214
40.446465 -104.638214
38.273003 -102.645294
38.273003 -102.645294
38.273003 -102.645294
40.568455 -105.587776
40.568455 -105.587776
40.568455 -105.587776
38.964100 -105.149200
38.964100 -105.149200
38.964100 -105.149200
37.746120 -106.829262
37.746120 -106.829262
37.746120 -106.829262
37.138802 -104.410873
37.138802 -104.410873
37.138802 -104.410873
34.942390 -106.457901
34.942390 -106.457901
34.942390 -106.457901
34.942390 -106.457901
34.942390 -106.457901
34.942390 -106.457901
34.942390 -106.457901
34.942390 -106.457901
34.942390 -106.457901
34.942390 -106.457901
34.942390 -106.457901
34.942390 -106.457901
34.942390 -106.457901
34.946266 -106.460052
34.946266 -106.460052
34.946266 -106.460052
34.945118 -106.460052
34.945118 -106.460052
34.945118 -106.460052
34.945488 -106.461761
34.945488 -106.461761
34.945488 -106.461761
34.942299 -106.462601
34.942299 -106.462601
34.942299 -106.462601
34.943298 -106.459732
34.943298 -106.459732
34.943298 -106.459732
34.943615 -106.456734
34.943615 -106.456734
34.943615 -106.456734
34.945320 -106.456573
34.945320 -106.456573
34.945320 -106.456573
34.945320 -106.456581
34.945389 -106.456467
34.945320 -106.456581
34.945389 -106.456467
34.945320 -106.456581
34.945389 -106.456467
34.945320 -106.456581
34.945389 -106.456467
34.945320 -106.456581
34.945389 -106.456467
34.945320 -106.456581
34.945389 -106.456467
37.993610 -97.992775
37.993610 -97.992775
37.993610 -97.992775
36.478210 -98.742226
36.478210 -98.742226
36.478210 -98.742226
34.944077 -106.459641
34.944077 -106.459641
34.944077 -106.459641
34.944077 -106.459641
34.944077 -106.459641
34.944077 -106.459641
34.944084 -106.459663
34.944084 -106.459663
34.944084 -106.459663
34.944084 -106.459663
34.944084 -106.459663
34.944084 -106.459663
34.945911 -106.457199
34.945911 -106.457199
34.945911 -106.457199
34.945911 -106.457199
34.945911 -106.457199
34.945911 -106.457199
34.945911 -106.457199
34.945911 -106.457199
34.945911 -106.457199
34.945911 -106.457199
34.945911 -106.457199
39.011200 -102.627296
39.011200 -102.627296
39.011200 -102.627296
33.969601 -102.772400
33.969601 -102.772400
33.969601 -102.772400
38.422501 -98.711098
38.422501 -98.711098
38.422501 -98.711098
36.869598 -98.793098
36.869598 -98.793098
36.869598 -98.793098
36.930099 -99.270599
36.930099 -99.270599
36.930099 -99.270599
36.526871 -99.172943
36.526871 -99.172943
36.526871 -99.172943
36.513783 -98.499062
36.513783 -98.499062
36.513783 -98.499062
37.226719 -97.970947
37.226719 -97.970947
37.226719 -97.970947
34.921665 -99.354698
34.921665 -99.354698
34.921665 -99.354698
35.606644 -99.500587
35.606644 -99.500587
35.606644 -99.500587
35.974934 -98.815308
35.974934 -98.815308
35.974934 -98.815308
36.335587 -98.192787
36.335587 -98.192787
36.335587 -98.192787
35.645557 -98.688889
35.645557 -98.688889
35.645557 -98.688889
36.065254 -99.418045
36.065254 -99.418045
36.065254 -99.418045
36.017059 -98.332695
36.017059 -98.332695
36.017059 -98.332695
36.634682 -98.931931
36.634682 -98.931931
36.634682 -98.931931
36.444012 -100.296883
36.444012 -100.296883
36.444012 -100.296883
35.390862 -101.947433
35.390862 -101.947433
35.390862 -101.947433
36.437950 -102.737427
36.437950 -102.737427
35.104549 -100.242477
35.104549 -100.242477
35.104549 -100.242477
34.883701 -101.680801
34.883701 -101.680801
34.883701 -101.680801
38.813999 -99.737396
38.813999 -99.737396
38.813999 -99.737396
39.799702 -105.613403
39.799702 -105.613403
39.799702 -105.613403
40.945099 -102.032997
40.945099 -102.032997
40.945099 -102.032997
37.745602 -105.501198
37.745602 -105.501198
37.745602 -105.501198
36.802059 -104.863602
36.802059 -104.863602
36.802059 -104.863602
36.840790 -105.039101
36.840790 -105.039101
36.840790 -105.039101
37.121960 -104.782898
37.121960 -104.782898
37.121960 -104.782898
EOF

#####
#  This will draw a box in black -Wblack
#  The box will be filled with white -G255/255/25
#  the text is 10 point, Helvetica, black, aligned Left Bottom and angle 0
#  To just draw the text remove -G255/255/255 -W0/0/0 from the command line
#####
gmt pstext -P -J${PROJ} -R${LATLON} -O -:  -V -Dj0.1i/0.1i -G255/255/255 -F+f10p,Helvetica,black+jLB+a0 -Wblack  >> ${FNAME} << EOF
40.446465 -104.638214 CHIL    
40.446465 -104.638214 CHIL    
40.446465 -104.638214 CHIL    
38.273003 -102.645294 LAMA    
38.273003 -102.645294 LAMA    
38.273003 -102.645294 LAMA    
40.568455 -105.587776 MCSU    
40.568455 -105.587776 MCSU    
40.568455 -105.587776 MCSU    
38.964100 -105.149200 Q24A    
38.964100 -105.149200 Q24A    
38.964100 -105.149200 Q24A    
37.746120 -106.829262 S22A    
37.746120 -106.829262 S22A    
37.746120 -106.829262 S22A    
37.138802 -104.410873 T25A    
37.138802 -104.410873 T25A    
37.138802 -104.410873 T25A    
34.942390 -106.457901 ALQ1    
34.942390 -106.457901 ALQ1    
34.942390 -106.457901 ALQ1    
34.942390 -106.457901 ALQ1    
34.942390 -106.457901 ALQ1    
34.942390 -106.457901 ALQ1    
34.942390 -106.457901 ALQ1    
34.942390 -106.457901 ALQ2    
34.942390 -106.457901 ALQ2    
34.942390 -106.457901 ALQ2    
34.942390 -106.457901 ALQ2    
34.942390 -106.457901 ALQ2    
34.942390 -106.457901 ALQ2    
34.946266 -106.460052 ASA1    
34.946266 -106.460052 ASA1    
34.946266 -106.460052 ASA1    
34.945118 -106.460052 ASA2    
34.945118 -106.460052 ASA2    
34.945118 -106.460052 ASA2    
34.945488 -106.461761 ASA3    
34.945488 -106.461761 ASA3    
34.945488 -106.461761 ASA3    
34.942299 -106.462601 ASA4    
34.942299 -106.462601 ASA4    
34.942299 -106.462601 ASA4    
34.943298 -106.459732 ASA5    
34.943298 -106.459732 ASA5    
34.943298 -106.459732 ASA5    
34.943615 -106.456734 ASA6    
34.943615 -106.456734 ASA6    
34.943615 -106.456734 ASA6    
34.945320 -106.456573 ASL8    
34.945320 -106.456573 ASL8    
34.945320 -106.456573 ASL8    
34.945320 -106.456581 ASL9    
34.945389 -106.456467 ASL9    
34.945320 -106.456581 ASL9    
34.945389 -106.456467 ASL9    
34.945320 -106.456581 ASL9    
34.945389 -106.456467 ASL9    
34.945320 -106.456581 ASL9    
34.945389 -106.456467 ASL9    
34.945320 -106.456581 ASL9    
34.945389 -106.456467 ASL9    
34.945320 -106.456581 ASL9    
34.945389 -106.456467 ASL9    
37.993610 -97.992775 KS28    
37.993610 -97.992775 KS28    
37.993610 -97.992775 KS28    
36.478210 -98.742226 OK038   
36.478210 -98.742226 OK038   
36.478210 -98.742226 OK038   
34.944077 -106.459641 VEA1    
34.944077 -106.459641 VEA1    
34.944077 -106.459641 VEA1    
34.944077 -106.459641 VEA1    
34.944077 -106.459641 VEA1    
34.944077 -106.459641 VEA1    
34.944084 -106.459663 VEA2    
34.944084 -106.459663 VEA2    
34.944084 -106.459663 VEA2    
34.944084 -106.459663 VEA2    
34.944084 -106.459663 VEA2    
34.944084 -106.459663 VEA2    
34.945911 -106.457199 ANMO    
34.945911 -106.457199 ANMO    
34.945911 -106.457199 ANMO    
34.945911 -106.457199 ANMO    
34.945911 -106.457199 ANMO    
34.945911 -106.457199 ANMO    
34.945911 -106.457199 ANMO    
34.945911 -106.457199 ANMO    
34.945911 -106.457199 ANMO    
34.945911 -106.457199 ANMO    
34.945911 -106.457199 ANMO    
39.011200 -102.627296 KSCO    
39.011200 -102.627296 KSCO    
39.011200 -102.627296 KSCO    
33.969601 -102.772400 MSTX    
33.969601 -102.772400 MSTX    
33.969601 -102.772400 MSTX    
38.422501 -98.711098 R32B    
38.422501 -98.711098 R32B    
38.422501 -98.711098 R32B    
36.869598 -98.793098 ALVA    
36.869598 -98.793098 ALVA    
36.869598 -98.793098 ALVA    
36.930099 -99.270599 FREE    
36.930099 -99.270599 FREE    
36.930099 -99.270599 FREE    
36.526871 -99.172943 FW03    
36.526871 -99.172943 FW03    
36.526871 -99.172943 FW03    
36.513783 -98.499062 FW06    
36.513783 -98.499062 FW06    
36.513783 -98.499062 FW06    
37.226719 -97.970947 KS08    
37.226719 -97.970947 KS08    
37.226719 -97.970947 KS08    
34.921665 -99.354698 SC12    
34.921665 -99.354698 SC12    
34.921665 -99.354698 SC12    
35.606644 -99.500587 SC15    
35.606644 -99.500587 SC15    
35.606644 -99.500587 SC15    
35.974934 -98.815308 SC16    
35.974934 -98.815308 SC16    
35.974934 -98.815308 SC16    
36.335587 -98.192787 AMES    
36.335587 -98.192787 AMES    
36.335587 -98.192787 AMES    
35.645557 -98.688889 CSTR    
35.645557 -98.688889 CSTR    
35.645557 -98.688889 CSTR    
36.065254 -99.418045 ELIS    
36.065254 -99.418045 ELIS    
36.065254 -99.418045 ELIS    
36.017059 -98.332695 HTCH    
36.017059 -98.332695 HTCH    
36.017059 -98.332695 HTCH    
36.634682 -98.931931 NOKA    
36.634682 -98.931931 NOKA    
36.634682 -98.931931 NOKA    
36.444012 -100.296883 DRZT    
36.444012 -100.296883 DRZT    
36.444012 -100.296883 DRZT    
35.390862 -101.947433 PH02    
35.390862 -101.947433 PH02    
35.390862 -101.947433 PH02    
36.437950 -102.737427 RTBA    
36.437950 -102.737427 RTBA    
35.104549 -100.242477 SMWD    
35.104549 -100.242477 SMWD    
35.104549 -100.242477 SMWD    
34.883701 -101.680801 AMTX    
34.883701 -101.680801 AMTX    
34.883701 -101.680801 AMTX    
38.813999 -99.737396 CBKS    
38.813999 -99.737396 CBKS    
38.813999 -99.737396 CBKS    
39.799702 -105.613403 ISCO    
39.799702 -105.613403 ISCO    
39.799702 -105.613403 ISCO    
40.945099 -102.032997 OGNE    
40.945099 -102.032997 OGNE    
40.945099 -102.032997 OGNE    
37.745602 -105.501198 SDCO    
37.745602 -105.501198 SDCO    
37.745602 -105.501198 SDCO    
36.802059 -104.863602 UNM2    
36.802059 -104.863602 UNM2    
36.802059 -104.863602 UNM2    
36.840790 -105.039101 UNM3    
36.840790 -105.039101 UNM3    
36.840790 -105.039101 UNM3    
37.121960 -104.782898 UNM5    
37.121960 -104.782898 UNM5    
37.121960 -104.782898 UNM5    
EOF


######
#     Cleanup
######
rm -f map.grd cmap.grd MA.grd map.cpt