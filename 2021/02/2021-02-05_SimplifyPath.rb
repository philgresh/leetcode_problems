# https://leetcode.com/explore/featured/card/february-leetcoding-challenge-2021/584/week-1-february-1st-february-7th/3629/
# Simplify Path

# Given a string path, which is an absolute path (starting with a slash '/')
# to a file or directory in a Unix-style file system, convert it to the
# simplified canonical path.

# In a Unix-style file system, a period '.' refers to the current directory,
# a double period '..' refers to the directory up a level, and any multiple
# consecutive slashes (i.e. '//') are treated as a single slash '/'.
# For this problem, any other format of periods such as '...' are treated as
# file/directory names.

# The canonical path should have the following format:

#     The path starts with a single slash '/'.
#     Any two directories are separated by a single slash '/'.
#     The path does not end with a trailing '/'.
#     The path only contains the directories on the path from the root
#     directory to the target file or directory (i.e., no period '.' or
#     double period '..')

# Return the simplified canonical path.

# @param {String} path
# @return {String}
def simplify_path(path)
  # Strip all slashes and split dirs
  # Read through dirs but keep a pointer at curr dir (never less than index 0)
  #   ".." move pointer back one
  #   "." ignore
  # Build new path string

  dirs = path.split("/")
  pointer = 0
  new_path = []
  dirs.each.with_index do |dir, i|
    case dir
    when ""
      next
    when "."
      next
    when ".."
      new_path.pop
    else
      new_path.push(dir)
    end
  end
  return "/" + new_path.join("/")
end

# Example 1:

# Input:
path = "/home/"
# Output: "/home"
puts simplify_path(path)
# Explanation: Note that there is no trailing slash after the last directory name.

# Example 2:

# Input:
path = "/../"
# Output: "/"
puts simplify_path(path)
# Explanation: Going one level up from the root directory is a no-op, as the root level is the highest level you can go.

# Example 3:

# Input:
path = "/home//foo/"
# Output: "/home/foo"
puts simplify_path(path)
# Explanation: In the canonical path, multiple consecutive slashes are replaced by a single one.

# Example 4:

# Input:
path = "/a/./b/../../c/"
# Output: "/c"
puts simplify_path(path)

# Example 5:

# Input:
path = "/a/../../b/../c//.//"
# Output: "/c"
puts simplify_path(path)

# Example 6:

# Input:
path = "/a//b////c/d//././/.."
# Output: "/a/b/c"
puts simplify_path(path)

# Constraints:

#     1 <= path.length <= 3000
#     path consists of English letters, digits, period '.', slash '/' or '_'.
#     path is a valid absolute Unix path.
