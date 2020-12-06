BEGIN {
    RS = ""; 
    FS = "";
}
{
    delete already_scan
    split($0,line,"");

    for(key in line) {
        resp = line[key];
        if(resp != "" && resp != "\n" && resp != " "  && resp in already_scan == 0)
            already_scan[resp]=""
    }

    c+=length(already_scan)
}
END {
    print "RESULT :", c;
}