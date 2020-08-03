module Ex120

def gcd(a, b)
    if b==0
        sprintf("returning %d", a)
        a
    else
        sprintf("remainder %d %d", a, b)
        gcd(b, a % b)
    end
end

class Gcd
    def initialize(a, b)
        @a = a
        @b = b
    end

    def eval
        if @b==0
            sprintf("returning %d", @a)
            @a
        else
            sprintf("remainder %d %d", @a, @b)
            Gcd.new(@b, @a % @b).eval
        end
    end
        
end

end 


include Ex120
print "Testing\n"
print gcd(206, 40) == 2 , "\n"
print gcd(48, 36) == 12 , "\n"
print gcd(60, 45) == 15 , "\n"
print "Class version \n"
print Gcd.new(206, 40).eval == 2 , "\n"
print Gcd.new(48, 36).eval == 12 , "\n"
print Gcd.new(60, 45).eval == 15 , "\n"
