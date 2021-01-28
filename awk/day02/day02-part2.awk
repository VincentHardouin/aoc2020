BEGIN {
    FS="[- :]+" 
}
{
    count+=1==(substr($4,$1,1)==$3)+(substr($4,$2,1)==$3)
}
END{
    print count;
}gs