{
val[$1]++;
}
END{
for (var in val) {
    delete val[var]
    for (var2 in val) {
        for (var3 in val) {
            if (var + var2 + var3 == 2020) 
                print "result: " var*var2*var3, "\t";
        }
    }   
}
}