BEGIN {
   x=0;
   tree="#";
   right=1;
}
{
    if (NR % 2 == 0) {
         if (substr($1,x+1,1) == tree)
        numberOfTree+=1   
        x+=right;    

        x = x % length($1);
    }
}
END{
    print numberOfTree;
}