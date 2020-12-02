BEGIN {
    count=0;
}
{
    $1 $2 $3; 
    split($1, rep, "-");
    split($2, char, ":");
    split($3, pass, "");

    n=0;

    if (pass[rep[1]] == char[1])
        n++;

    if (pass[rep[2]] == char[1])
        n++;    

    if(n == 1) {
        count++;
    }
}
END{
    print count;
}