#!bin/bash
loadavg5=$(cat /proc/loadavg | awk '{print $2}') #loadavg чтобы перевести в % нужно разделить на количество ядер и * на 100
res=$(echo "scale=2; $loadavg5/2*100" | bc -l) # bc по сути язык для проведения арифметических операций, умеет вычислять с плавающей точкой; scale - число знаков после запятой
res2=$(echo $res | cut -d. -f1) # переводит число из float в int
if (( $res2 >= 50 && $res2 < 60 ));then
echo "-10" > /tmp/track_file1
fi
if (( $res2 >= 60 && $res2 < 70 ));then
echo "-20" > /tmp/track_file1
fi
if (( $res2 >= 70 && $res2 < 80 ));then
echo "-30" > /tmp/track_file1
fi
if (( $res2 >= 80 && $res2 <= 100 ));then
echo "-40" > /tmp/track_file1
fi
