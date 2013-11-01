#!/bin/bash

AWK=awk
ps=ps/map.ps
in=data/gmt-1.txt

azimuth="-E210/20"
lats="-R70/90/0/35"

pscoast -Rd -Dh $lats -JX7id/7id -Dc -Gchocolate $azimuth -K  > $ps

psxyz $in ${lats}/1/1000 -J -JZ2.5il -So0.1ib1 -Ggray -Wthinner \
	-B10g10/10g10/a1p:dust:WSneZ -O -K $azimuth >> $ps

# $AWK '{print $1, $2, 20, 0, 0, "RM", $3}' GMT-1.txt
# 	# | pstext -Rd -J -O -K -E200/40 -Gwhite -Sthinner -D-0.2i/0 >> $ps

echo "4.5 6 30 0 5 BC Dust Distribution" | pstext -R0/11/0/8.5 -Jx1i -O >> $ps
