"""
# module Ex111

- Julia version: 
- Author: Yohan
- Date: 2018-08-15

# Examples

```jldoctest
julia>
```
"""
module Ex111

recursive(n) = n < 3 ? n : recursive(n-1) + 2 * recursive(n-2) + 3 * recursive(n-3)

single(a, b, c) = a + 2 * b + 3 * c

helper(a, b, c, n) = n == 3 ? single(a, b, c) : helper(single(a, b, c), a, b, n - 1)

iterative(n) = n < 3 ? n : helper(2, 1, 0, n)

end