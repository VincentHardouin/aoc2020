function push (a, v,     n) {
  n=length(a)+1;
  while (n in a) n++;
  a[n]=v;
}

BEGIN {
   RS = ""; 
   FS = "[\n :]+";

   fields["byr"]="";
   fields["iyr"]="";
   fields["eyr"]="";
   fields["hgt"]="";
   fields["hcl"]="";
   fields["ecl"]="";
   fields["pid"]="";
}
{
    delete vars;
    delete already_scan;

    for (i=1; i <= NF; i++) {
        if (i % 2 == 1)
            push(vars, $i);
    }

    for (key in vars) {
        if (vars[key] in fields && vars[key] in already_scan == 0)
            already_scan[vars[key]]="";   
    }

    if (length(already_scan) == length(fields)) 
        c+=1;
 
}
END {
    print "RESULT :", c;
}