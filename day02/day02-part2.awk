BEGIN {
    FS="[- :]+" 
}
{
    split($4, pass, "");

    n=0;

    if (pass[$1] == $3)
        n++;

    if (pass[$2] == $3)
        n++;    

    if(n == 1) {
        count++;
    }
}
END{
    print count;
}