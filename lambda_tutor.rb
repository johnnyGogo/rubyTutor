def lambda_tutor
    f = lambda { |x, y| x + y }
    puts f.call(3,5)

    f = -> (x, y) { x + y }
    puts f.call(3,5)
end

lambda_tutor