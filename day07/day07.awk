function isShiny(val) {
    return val ~ /shiny gold/
}

function isEmpty(val) {
    return key2 ~ /no other/
}

function check(sacs, key) {
    if (isShiny(key)) {
        return 1; 
    } 
    if (!isEmpty(key)) {
        for (key2 in sacs[key]) {
            #print "check: k:", key, "k2:", key2;
            val = check(sacs, key2);
            if (val == 1) {
                return val;
            }
        }    
    }
    return
}


BEGIN {
    FS=" bags contain | bag, | bags, "
}
{
    for (i=2; i <= NF; i++) {
        gsub(/[0-9] /, "", $i);
        gsub(/ bag[.]/, "", $i);
        gsub(/ bags[.]/, "", $i);

        sacs[$1][$i] = "";
    }
    
}
END {
    for (key in sacs) {
        for (key2 in sacs[key]) {
            # print key, ": key2 ->", key2;
            if (check(sacs, key2) == 1) {
                c++;
                break;
            }
        } 
    }

    print "RESULT :", c;
}