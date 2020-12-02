BEGIN {
    count=0;
}
{
    $1 $2 $3; 
    split($1, rep, "-");
    split($2, char, ":");
    split($3, pass, "");

    n=0;

    for (i=1; i <= length($3); i++) {
        if (pass[i] == char[1]) {
            n++; 
        } 
    }

    if(n >= rep[1] && n <= rep[2]) {
        count++;
    }
}
END{
    print count;
}