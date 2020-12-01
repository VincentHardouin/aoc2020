{
val[$1]++;
}
END{
for (var in val) {
    delete val[var]
    for (var2 in val) {
        if (var + var2 == 2020) 
            print "result: " var*var2, "\t";
    }   
}
}