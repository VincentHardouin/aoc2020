BEGIN {
   RS = ""; 
   FS = "[\n :]+";

   fields["byr"]="^19[2-9][0-9]|200[0-2]$";
   fields["iyr"]="^201[0-9]|2020$";
   fields["eyr"]="^202[0-9]|2030$";
   fields["hgt"]="^1[5-8][0-9]cm|19[0-3]cm|59in|6[0-9]in|7[0-6]in$";
   fields["hcl"]="^#[a-f0-9]{6}$";
   fields["ecl"]="^(amb|blu|brn|gry|grn|hzl|oth)";
   fields["pid"]="^[0-9]{9}$";
}
{
    delete already_scan;

    for(i=1; i<NF; i+=2) {
        if ($i in fields && $i in already_scan == 0 && match($(i+1), fields[$i])) {
            already_scan[$i]="";  
        }
    }

    if (length(already_scan) == length(fields)) {
        c+=1;
    }
       
}
END {
    print "RESULT :", c;
}