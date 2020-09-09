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

// combination sum 3
//https://leetcode.com/problems/combination-sum-iii/

func backtrack(remain: Int,k: Int,
               comb: inout [Int], next_start: Int,
               results: inout [[Int]]) {
    
    if (remain == 0 && comb.count == k) {
        // Note: it's important to make a deep copy here.
        results.append(comb)
        return;
    } else if (remain < 0 || comb.count == k) {
        return;
    }
    
    // Iterate through the reduced list of candidates.
    for i in stride(from: next_start, to: 9, by: 1) {
        comb.append(i + 1);
        backtrack(remain: remain - i - 1, k: k, comb: &comb, next_start: i + 1, results: &results);
        comb.removeLast()
    }
}

public func combinationSum3(k: Int, n: Int)  -> [[Int]]{
    var results = [[Int]]()
    var comb = [Int]()
    backtrack(remain: n, k: k, comb: &comb, next_start: 0, results: &results);
    return results
}

combinationSum3(k: 3, n: 9)
