class SieveEratosthenes

  def initialize(max)
    @max = max
  end

  def sieve_of_eratosthenes
    prime_ary = (0..@max).to_a
    prime_ary[0] = prime_ary[1] = nil

    prime_ary.each do |el|
      next unless el
      break if el*el > @max
      (el*el).step(@max,el) { |num| prime_ary[num] = nil }
    end
    prime_ary
  end

end

sieve1 = SieveEratosthenes.new(10)
puts sieve1.sieve_of_eratosthenes.to_a.compact.inspect
sieve2 = SieveEratosthenes.new(60)
puts sieve2.sieve_of_eratosthenes.to_a.compact.inspect
