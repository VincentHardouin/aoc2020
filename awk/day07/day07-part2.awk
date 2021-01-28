
function isEmpty(val) {
    return val ~ /no other/
}

function sum(sacs, key) {

    if (isEmpty(key)) {
        return; 
    }

    for (key2 in sacs[key]) {
        print "k:", key, "k2:", key2, "nb:", sacs[key][key2];
        count = sacs[key][key2];
        rslt = rslt + count + (count * sum(sacs, key2));
        print "rslt: ", rslt, "count:", count;
    }  
    
    return rslt;
}


BEGIN {
    FS=" bags contain | bag, | bags, "
}
{
    for (i=2; i <= NF; i++) {
        gsub(/ bag[.]/, "", $i);
        gsub(/ bags[.]/, "", $i);

        if ($i ~ /[0-9]/) {
            split($i, a, /[0-9] /, b);
        
            gsub(" ", "", b[1]);
     
            sacs[$1][a[2]] = b[1];
        } else {
            sacs[$1][$i] = 0;
        }

    }
    
}
END {
    for (key in sacs) {
        if (key ~ /shiny gold/) {
            c = sum(sacs, key);
        }
    }

    print "RESULT :", c;
}