# integer division and remainder function
# satisfy the following properties:
# - a = quot(a, b)*b + rem(a, b)
# - 0 <= quot(a, b) < |b|
# this is different from Ruby's % and / operators,
# for which only the first property holds
def quot(a, b)
  if b < 0
    (a.to_f / b).ceil
  else
    (a.to_f / b).floor
  end
end

def rem(a, b)
  a - (b * quot(a, b))
end

# GCD function using the Euclidean algorithm
# returns the greatest common denominator of a and b
def gcd(a, b)
  gcd_extended(a, b)[0]
end

# GCD function using the extended Euclidean algorithm
# returns an array of three values [d, s, t],
# such that d is the greatest common denominator of a and b,
# and a*s + b*t = d
def gcd_extended(a, b)
  raise ArgumentError if a == 0 && b == 0
  return [a, 1, 0] if a == b
  return [a, 1, 0] if b == 0

  if a < 0 || b < 0
    d, s, t = gcd_extended(a.abs, b.abs)
    return [d, a/a.abs * s, b/b.abs * t]
  end

  if b > a
    d, s, t = gcd_extended(b, a)
    return [d, t, s]
  end

  r = [a, b]
  multiples = [[1, 0], [0, 1]]

  while (r[0] % r[1] != 0)
    new_r = r[0] % r[1]
    new_multiples = [
      multiples[0][0] - (r[0]/r[1])*multiples[1][0],
      multiples[0][1] - (r[0]/r[1])*multiples[1][1]
    ]

    r[0] = r[1]
    r[1] = new_r
    multiples[0] = multiples[1]
    multiples[1] = new_multiples
  end

  [r[1], multiples[1][0], multiples[1][1]]
end
