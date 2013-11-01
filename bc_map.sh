#!/bin/bash

AWK=awk
ps=ps/map.ps
pscoast -Rd -Dh -R70/90/0/35/1/10000 -JX5id/5id -Dc -Gchocolate -E200/40 -K  > $ps

psxyz GMT-1.txt -R70/90/0/35/1/100 -J -JZ2.5il -So0.3ib1 -Ggray -Wthinner \
	-B10g10/10g10/a1p:dust:WSneZ -O -K -E200/40 >> $ps

# psxyz agu2008.d -R-180/180/-90/90/1/100000 -J -JZ2.5il -So0.3ib1 -Ggray -Wthinner \
# 	-B60g60/30g30/a1p:Memberships:WSneZ -O -K -E200/40 >> $ps

# $AWK '{print $1, $2, 20, 0, 0, "RM", $3}' GMT-1.txt
# 	# | pstext -Rd -J -O -K -E200/40 -Gwhite -Sthinner -D-0.2i/0 >> $ps

# echo "4.5 6 30 0 5 BC AGU 2008 Membership Distribution" | pstext -R0/11/0/8.5 -Jx1i -O >> $ps
