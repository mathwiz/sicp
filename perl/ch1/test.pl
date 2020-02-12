@x = (1,2,3,4,5);

print "@x\n";
print(shift @x, "\n");
print "@x\n";
unshift @x, -1;
print "@x\n";
print(pop @x, "\n");
print "@x\n";
push @x, 10;
print "@x\n";
