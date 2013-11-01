#!/bin/bash

AWK=awk
ps=ps/map.ps
in=data/gmt-1.txt

azimuth="-E200/40"
lats="-R65/95/0/35"

pscoast -Rd -Dh $lats -JX7id/7id -Dh -Gchocolate $azimuth -K  > $ps

psxyz $in ${lats}/1/160  -J -JZ2.5i -So0.1ib1 -Ggray -Wthinner \
	-B10g10/10g10/a20:"dust":WSneZ -O -K $azimuth >> $ps

$AWK '{print $1, $2, 10, 0, 0, "RM", $3}' $in  \
 | pstext $lats -J -O -K $azimuth -Sthinner  >> $ps

echo "4.5 6 30 0 5 BC Dust Distribution" | pstext -R0/11/0/8.5 -Jx1i -O >> $ps
