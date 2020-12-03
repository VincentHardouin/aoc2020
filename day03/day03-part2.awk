BEGIN {
   x=0;
   tree="#";
   right=3;
   down=1;
}
{
    if (NR % down == 0) {
        if (substr($1,x+1,1) == tree)
            numberOfTree+=1;

        x+=right;    
        x = x % length($1);
    }
}
END{
    print numberOfTree;
}