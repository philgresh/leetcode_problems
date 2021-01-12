require "byebug"
require "bigdecimal"
MIN = 25

def gen_large_prime(min = 255, max = 256)
  primes = gen_first_n_primes
  max_attempts = 100 * (Math.log2(max) + 1)
  num_attempts = 0
  num = 0

  until rabin_miller(num)
    # debugger
    if num_attempts >= max_attempts / 2
      debugger
    end
    num_attempts += 1
    return nil if num_attempts >= max_attempts
    num = rand(2 ** min...2 ** max)
  end
  return num
end

def is_prime?(num, primes)
  return false if num < 2
  primes.each { |n| return false if num % n == 0 }
  debugger
  return is_prime_basic?(num, 2 ** MIN)
end

def is_prime_basic?(num, start)
  return false if num < start
  start += 1 if start % 2 == 0
  (start...num).step(2).each do |n|
    return false if num % n == 0
  end
  return true
end

def gen_first_n_primes(n = 1000)
  primes = [2]
  i = 3
  until primes.length == n
    primes << i if is_prime_basic?(i, 3)
    i += 2
  end
  primes
end

def rabin_miller(num)
  return false if ((num < 3) || (num % 2 == 0))

  s = (num - 1)
  t = 0
  while (s % 2 == 0)
    s = (s / 2)
    t += 1
  end

  k_tests = 0
  while (k_tests < 128)
    rand_a = BigDecimal(rand(2..num - 1).to_s)
    v = ((rand_a ** s) % num)
    if v != 1
      i = 0
      while v != (num - 1)
        if (i == (t - 1))
          return false
        else
          debugger
          v = (v ** 2) % num
          i += 1
        end
      end
    end
    k_tests += 2
  end
  return true
end

# p gen_large_prime(25, 26)
# p gen_large_prime(255, 256)
# p gen_large_prime(255, 256)
p rabin_miller 35976989
