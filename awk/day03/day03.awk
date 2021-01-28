BEGIN {
   x=0;
   tree="#";
}
{
    if (substr($1,x+1,1) == tree)
        numberOfTree+=1   
    
    x+=3;    

    x = x % length($1);
}
END{
    print numberOfTree;
}