BEGIN {
    FS="";
}
{
    d = 0; 
    f = 127;

    l=0
    r=7; 

    for (i=1; i<=NF; i++) {    
        n = int((f-d)/2); 

        if ($i == "F") {
            d = d;
            f = d + n;
        }     
        else if ($i == "B") {
            d = f - n; 
            f = d + n; 
        } 

        if (i > NF-3) {
            n = int((r-l)/2)
            if ($i == "L") {
                l = l;
                r = l + n;
            } else if ($i == "R") {
                l = r - n; 
                r = l + n; 
            }
        }   
    }

    
    seatId = d * 8 + l; 

    seatsId[NR] = seatId; 

    if (seatId > maxSid) {
        maxSid = seatId 
    }    

 #   print "v:" , $i , "d:" , d, "f:" , f, "l:", l, "r:", r, "sid:", seatId

}
END {
    asort(seatsId); 
    n= seatsId[1];
    for(i=1; i <= length(seatsId); i++) {
        if (n != seatsId[i]) {
            print "Missing seatId:", n;
            break;
        }
        n++;
    }
    print "RESULT :", maxSid;
}