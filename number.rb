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

  r1 = [a.abs, b.abs].max
  r2 = [a.abs, b.abs].min
  return r1 if r2 == 0

  while (r1 % r2 != 0)
    new_r = r1 % r2
    r1 = r2
    r2 = new_r
  end

  r2
end
