BEGIN {
    RS = ""; 
    FS = "\n";
}
{
    delete already_scan
    split($0,people,"\n");

    for(key in people) {
        split(people[key], resps, "");
        
        for (key2 in resps) {
            resp = resps[key2];
            if(resp != "" && resp != "\n" && resp != " ") {
                already_scan[resp]=already_scan[resp]+1;    
            }
        }
    }

    for (key in already_scan) {
        if (already_scan[key] == length(people)) {
            c++;
        }
    }

}
END {
    print "RESULT :", c;
}