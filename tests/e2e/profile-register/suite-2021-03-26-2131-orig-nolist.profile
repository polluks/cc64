2021-03-26T21:31:18+01:00
Original version without src list during compile

profiler report PROFILE-CC64-1
timestamps
830.786.988 989.908.172 

buckets
b# addr[  ]addr  nextcounts  clockticks  name
0 15887 65535       475419    52854657  (etc)
1 19318 21455      1035458   114210370  [MEMMAN-ETC]
2 21459 22678      1384162   153117590  [FILE-HANDLING]
3 22682 23339       313708    34373231  [INPUT]
4 23343 25749      2695157   299094501  [SCANNER]
5 25753 27129       153639    17396511  [SYMTAB]
6 27133 35110      1826434   197594285  [PARSER]
7 35114 36672      1100491   121235385  [PASS2]
8 36815 37565            0           0  [SHELL]


profiler report PROFILE-SCANNER1
timestamps
831.049.132 990.432.460 

buckets
b# addr[  ]addr  nextcounts  clockticks  name
0 15887 65535      7133690   786419989  (etc)
1 23363 23469       247516    29307096  [SCANNER-ALPHANUM]
2 23473 23754         2331      235295  [SCANNER-KEYWORD]
3 23758 23913        66366     7041541  [SCANNER-IDENTIFIER]
4 23917 24334      1075233   116806593  [SCANNER-OPERATOR]
5 24338 24578        27320     3492260  [SCANNER-NUMBER]
6 24582 25095       237738    26065758  [SCANNER-CHAR/STRING]
7 25099 25258       150400    15852898  [SCANNER-NEXTWORD]
8 25262 25408        43874     5184366  [SCANNER-COMMENT]


profiler report PROFILE-SCANNER2
timestamps
831.180.204 990.563.532 

buckets
b# addr[  ]addr  nextcounts  clockticks  name
0 15887 65535      6291642   691659740  (etc)
1 23363 23469       247516    29308255  [SCANNER-ALPHANUM]
2 23758 23913        66366     7040651  [SCANNER-IDENTIFIER]
3 23917 24334      1075233   116814924  [SCANNER-OPERATOR]
4 24338 24578        27320     3487498  [SCANNER-NUMBER]
5 24582 25095       237738    26065205  [SCANNER-CHAR/STRING]
6 25099 25258       150400    15851841  [SCANNER-NEXTWORD]
7 25262 25408        43874     5189985  [SCANNER-COMMENT]
8 25412 25749       844379    95121698  [SCANNER-REST]
