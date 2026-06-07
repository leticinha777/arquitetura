0:
  movh 0
  sub R3, R3
  sub R2, R2

1:
  movl 3
  sub R1, R1

2:
  add R2, R0

3:
  movh -8

4:
  movl 0

5:
  add R0, R3

6:
  st R3, R0

7:
  movh 1

8:
  movl 4
  add R1, R3

9:
  add R1, R0

10:
  movh -8

11:
  movl -4

12:
  add R0, R3

13:
  st R1, R0

14:
  movh -7
  sub R1, R1

15:
  movl -8

16:
  add R0, R3

17:
  st R1, R0

18:
  movh -8

19:
  movl 0

20:
  add R0, R3

21:
  ld R1, R0

22:
  movh -8

23:
  movl -4

24:
  add R0, R3

25:
  ld R0, R0

26:
  add R1, R0

27:
  movh -7

28:
  movl -8

29:
  add R0, R3

30:
  st R1, R0

31:
  movh 0
  inc R3

32:
  movl -4

33:
  sub R0, R3

34:
  bnzr R0, R2

35:
  sub R0, R0

36:
  brzi 0
