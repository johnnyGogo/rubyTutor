
def select_tutor
    puts '--- select_tutor ---'
    # like python filter

    # array
    a = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    s = a.select{ |n| n > 5}
    puts s

    # dict
    d = {a: 1, b: 2 ,c: 3, d: 4}
    s = d.select{ |k,v| v > 2 }
    puts s

    # dict
    d = {a: 1, b: 2 ,c: 3, d: 4}
    s = d.reject{ |k,v| v > 2 }
    puts s
end


def map_tutor
    puts '--- map_tutor ---'
    # array
    a = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    m = a.map{ |n| n*2 }
    puts m

    # dict
    d = {a: 1, b: 2 ,c: 3, d: 4}
    s = d.map{ |k,v| [k, v*2] }.to_h
    puts s
end


def reduce_tutor
    puts '--- reduce_tutor ---'
    # array
    a = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    m = a.reduce{ |x,y| x+y }
    puts m
end


def find_tutor
    puts '--- find_tutor ---'
    # array
    a = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    m = a.find{ |n| n == 3 }
    puts m

    # dict
    d = {a: 1, b: 2 ,c: 3, d: 4}
    s = d.find{ |k,v| v == 3 }
    puts s
end


select_tutor
map_tutor
reduce_tutor
find_tutor