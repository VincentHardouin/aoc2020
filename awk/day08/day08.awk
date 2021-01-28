function doAction(key, key2, arr, acc) {
    
    if (key > length(arr)) {
        return acc;
    }
    split(arr[key], el, " ");
    split(el[2], a, /+|-/, b); 
    action = el[1];
    number = a[2];
    operator = b[1]; 
    print "acc:", acc, "k:", key, "k2:", key2, "nb:" number, "act:", action;

    if (action ~ /jmp/) {
        nbJump = key + operator + number;
        return doAction(nbJump, key+1, arr, acc);
    } else if (action ~ /acc/) {
        print number;
        return doAction(key2, key2+1, arr, acc + operator + number); 
    } else {
        return doAction(key2, key2+1, arr, acc);
    }
}


BEGIN {
}
{
    arr[NR] = $0;
}
END {
    acc = doAction(1, 2, arr, 0);
        
    print "RESULT :", acc;
}