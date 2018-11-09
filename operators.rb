def true_test
    puts "not execute" if nil
    puts "not execute" if false

    puts "execute" if true # 輸出 execute
    puts "execute" if "" # 輸出 execute (和JavaScript不同)
    puts "execute" if 0 # 輸出 execute (和C不同)
    puts "execute" if 1 # 輸出 execute
    puts "execute" if "foo" # 輸出 execute
    puts "execute" if Array.new # 輸出 execute
end

true_test()