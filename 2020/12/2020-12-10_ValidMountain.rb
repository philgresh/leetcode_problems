# Set up pointer I at 1
# Set up upDirection as true
# Iterate through arr via I, checking if increasing and isPeak
#   If so,
#     Flip upDirection
# Continue iterating, expecting downhill slope
# Return false if not decreasing

# Edge cases:
#   arr.size <  3 => return false
#   Continuously increasing => last index, check if upDirection still true

# @param {Integer[]} arr
# @return {Boolean}
def valid_mountain_array(arr)
  return false if arr.size < 3
  i = 1
  upDirection = true
  while (i < arr.size)
    return false if upDirection && i == (arr.size - 1)
    return false unless isGoodSlope(arr, i, upDirection)
    upDirection = false if upDirection && isPeak(arr, i)
    i += 1
  end
  return true
end

def isGoodSlope(arr, i, upDirection)
  if upDirection
    return arr[i - 1] < arr[i]
  else
    return arr[i - 1] > arr[i]
  end
end

def isPeak(arr, i)
  arr[i - 1] < arr[i] && arr[i] > arr[i + 1]
end

# Example 1:

# Input:
arr = [2, 1]
# Output: false
puts valid_mountain_array(arr)

# Example 2:

# Input:
arr = [3, 5, 5]
# Output: false
puts valid_mountain_array(arr)

# Example 3:

# Input:
arr = [0, 3, 2, 1]
# Output: true
puts valid_mountain_array(arr)

# Example 4:

# Input:
arr = (0..9).to_a
# Output: true
puts valid_mountain_array(arr)

# Constraints:

#     1 <= arr.length <= 104
#     0 <= arr[i] <= 104
