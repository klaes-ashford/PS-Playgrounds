import Foundation

func countingStairs(n: Int, k: Int) -> [[Int]]{
    if n == 0 { return [[]] }
    var result = [[Int]]()
    for i in 1...k {
        if (n - 1 >= 0) {
            let others = countingStairs(n: n - 1, k: k).map { [i] + $0}
            others.forEach { result.append($0)}
        }
    }
    return result
}


print(countingStairs(n: 5, k: 2))

// all possible permutaions of given array:

func permute(_ nums: [Int]) -> [[Int]] {
    var output: [[Int]] = []
    var numsDupe = nums
    let n  = nums.count
    backtrack(n: n, nums: &numsDupe, output: &output, first: 0)
    return output
    
}

func backtrack(n: Int, nums: inout [Int], output: inout [[Int]], first: Int) {
    if (first == n) { output.append(nums) }
    var i = first
    while (i < n) {
        nums.swapAt(first, i)
        backtrack(n: n, nums: &nums, output: &output, first: first + 1);
        nums.swapAt(first, i)
        i += 1
    }
}

print(permute([1,2,3,4,5]))
