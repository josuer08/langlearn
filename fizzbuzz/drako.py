for i in range(1,101):
    no = 1
    if i % 3 == 0:    
        print("Fizz", end = '')
        no = 0
    if i % 5 == 0:
        print("Buzz", end = '')
        no = 0
    print (i if no else "")