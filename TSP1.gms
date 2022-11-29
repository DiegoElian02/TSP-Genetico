option optcr= 0.0001;

*/Conjunto que representa la cantidad de estados*/
set  
i/1*16/;

*/Alias que ayuda a expresar restriccion de subtour*/
alias (i,j); 

*/Matriz de distancias*/
table
c(i,j)

    1         2           3           4           5           6           7           8        9          10         11          12          13          14          15         16
1   999999    7577.79     9753.97     18957.71    20390.06    15382.47    13128.53    6260.45  11889.59   10046.79   6990.56     14693.79    43360.36    6338.18     19522.57   12755.98
2   6970.54   999999      11118.56    15562.40    13875.43    11987.16    4606.20     3912.20  7316.10    10143.35   9362.34     11298.48    36845.72    5635.12     20887.16   9360.67
3   10460.94  11655.47    9999999     17959.79    24467.75    15620.26    13366.32    8759.21  12127.37   9864.70    14631.28    13695.86    47438.04    6186.73     11400.12   11957.2
4   16614.23  14863.04    17308.75    9999999     27056.93    7845.45     13356.12    12815.46 12117.18   8546.97    20805.85    4505.11     50027.22    13163.27    25169.44   7946.41
5   19912.61  13582.41    24060.63    27575.80    9999999     21107.48    14361.16    16854.27 17071.06   22785.69   18084.97    23311.88    32498.39    18577.20    33829.24   19096.39
6   14769.62  11452.09    15231.30    7689.75     21350.73    999999      6931.52     9404.51  6410.98    8581.32    17394.90    6705.35     44321.02    9513.06     23092.00   4146.8
7   12642.16  6311.96     15599.17    13739.30    14138.57    7174.64     999999      7234.97  2775.13    8949.19    15225.36    9475.38     37108.86    7343.52     23459.87   5259.89
8   5662.60   3923.44     7854.12     13128.71    16735.71    9682.33     7428.39     999999   6189.45    7712.72    9798.74     8864.78     39706.00    2369.69     17622.73   7055.84
9   11668.98  5613.35     12030.04    12616.31    15575.93    6632.53     1875.12     6093.56  999999     7826.20    14083.96    8352.38     38546.22    6202.11     22336.88   4136.9
10  9793.15   9371.89     9599.00     10038.65    21877.14    7522.57     8176.34     7324.31  6937.39    999999     15314.71    5774.73     44847.44    5307.55     17459.69   4036.07
11  6910.20   8243.35     13229.51    21437.78    17105.35    17862.54    10893.56    8740.51  14369.65   13522.34   999999      17173.85    40075.64    9813.72     18685.27   15236.04
12  13430.74  10674.00    13349.14    5753.68     23097.32    6647.54     9396.51     8626.42  8157.57    5429.08    16616.81    9999999     46067.61    8631.03     21209.83   3986.8
13  41126.96  34796.76    45274.98    48790.16    30834.45    42321.83    35575.52    38068.63 38285.42   44000.05   39299.32    44526.23    999999      39791.55    55043.59   40310.75
14  5258.14   6225.11     5826.76     13636.27    19037.39    10189.90    7935.96     3328.85  6697.01    5265.13    10105.91    9372.35     42007.68    999999      15595.37   7563.41
15  18873.09  20067.63    9920.46     25403.69    32879.90    22887.61    21778.47    17171.36 20539.53   16833.29   23242.23    21139.76    55850.19    14598.89    9999999    19401.1
16  11778.55  8221.75     11496.66    8314.85     18823.0     3827.25     5122.2      6174.17  3883.25    4846.68    14164.57    3454.69     41793.3     6521.99     19357.35   999999

 ;
 

*/Definicion de variables enteras*/
variables
z, u(i);

*/Definicion de variables binaria*/
binary Variables
x(i,j);

*/Ecuacion objetivo, restricciones para pasar a todas las ciudades, restriccion de subtour*/
Equations
obj, r1,r2, subtour;

obj.. z =e= sum((i,j), c(i,j)*x(i,j));
r1(j).. sum(i, x(i,j))=e=1;
r2(i).. sum(j, x(i,j))=e=1;
subtour(i,j)$(ord(i)>1 and ord(j)>1 and ord(i)<>ord(j)).. u(i)-u(j)+card(i)*x(i,j)=l= card(i)-1;

model TSP /all/;
solve TSP using mip minimizing z;


*/ z óptimo es 166918.81  /*

