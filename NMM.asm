https://powcoder.com
代写代考加微信 powcoder
Assignment Project Exam Help
Add WeChat powcoder
.text
.globl NMM
 # for i = 0; i < N; i++
 #   for j = 0; j < N; j++
 #     c[i][j]=0
 #     for k = 0; k < N; k++
 #       c[i][j] = c[i][j] + a[i][k]*b[k][j] 
NMM:
sll $v0, $a3, 2 # bytes in 1 row = 4 * N ; no return value, use Vs as temps
add $t0, $0, $0 # i = 0
  iLOOP:
    add $t1, $0, $0 # j = 0
    jLOOP:
      add $t2, $0, $0 # k = 0
      # set c[i][j]=0
      multu $v0, $t0 # compute i rows, in bytes
      mflo $t3 # retrieve
      sll $t4, $t1, 2 # 4 * j
      add $t3, $t4, $t3 # sum row offset + column offset
      add $t3, $t3, $a2 # add offset to base
      sw $0, 0($t3) # set c[i][j] to zero
      kLOOP:
        ###
        #       c[i][j] = c[i][j] + a[i][k]*b[k][j]
        ## 
        addi $t2, $t2, 1 # k++
      bne $t2, $a3, kLOOP
      addi $t1, $t1, 1 # j++
    bne $t1, $a3, jLOOP
    addi $t0, $t0, 1 # i++
  bne $t0, $a3, iLOOP
jr $ra 



