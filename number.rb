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

def gcd(a, b)
  raise ArgumentError if a == 0 && b == 0
  return [a, 1, 0] if a == b
  return [a, 1, 0] if b == 0

  if a < 0 || b < 0
    d, s, t = gcd(a.abs, b.abs)
    return [
      d,
      a/a.abs * s,
      b/b.abs * t
    ]
  end

  if b > a
    d, s, t = gcd(b, a)
    return [d, t, s]
  end

  r1 = a
  r2 = b
  multiples_of_a_in_r1 = 1
  multiples_of_b_in_r1 = 0
  multiples_of_a_in_r2 = 0
  multiples_of_b_in_r2 = 1

  while (r1 % r2 != 0)
    new_r = r1 % r2
    multiples_of_a_in_new_r = multiples_of_a_in_r1 - (r1/r2)*multiples_of_a_in_r2
    multiples_of_b_in_new_r = multiples_of_b_in_r1 - (r1/r2)*multiples_of_b_in_r2

    r1 = r2
    r2 = new_r
    multiples_of_a_in_r1 = multiples_of_a_in_r2
    multiples_of_a_in_r2 = multiples_of_a_in_new_r
    multiples_of_b_in_r1 = multiples_of_b_in_r2
    multiples_of_b_in_r2 = multiples_of_b_in_new_r
  end

  [r2, multiples_of_a_in_r2, multiples_of_b_in_r2]
end
