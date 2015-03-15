require 'rspec'
require 'rantly'
require 'rantly/rspec_extensions'

require_relative './number'

describe 'integer division and modulo' do

  specify 'a = qb + r' do
    property_of { array(2) { integer }}.check do |(a, b)|
      q = quot(a, b)
      r = rem(a, b)

      expect(a).to eq q*b + r
    end
  end

  specify '0 <= r < |b|' do
    property_of { array(2) { integer }}.check do |(a, b)|
      q = quot(a, b)
      r = rem(a, b)

      expect(r).to be >= 0
      expect(r).to be < b.abs
    end
  end

end

describe '#gcd' do

  specify 'gcd(a, b) divides a and b' do
    property_of do
      a, b = array(2) { integer }
      guard(a != 0 || b != 0)
      [a, b]
    end.check do |(a, b)|
      d, _, _ = gcd(a, b)
      expect(a % d).to eq 0
      expect(b % d).to eq 0
    end
  end

  specify 'gcd(a, b) is the greatest divisor' do
    property_of do
      a, b = array(2) { integer }
      guard(a != 0 || b != 0)
      [a, b]
    end.check do |(a, b)|
      (1..100).each do |d|
        if (a % d) == 0 && (b % d) == 0
          expect(d).to be <= gcd(a, b)[0]
        end
      end
    end
  end

  specify 'gcd(0, 0) is undefined' do
    expect { gcd(0, 0) }.to raise_error ArgumentError
  end

  specify 'returns s and t such that as + bt = gcd(a, b)' do
    property_of do
      a, b = array(2) { integer }
      guard(a != 0 || b != 0)
      [a, b]
    end.check do |(a, b)|
      d, s, t = gcd(a, b)
      expect(d).to eq a*s + b*t
    end
  end

end
