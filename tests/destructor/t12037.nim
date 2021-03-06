discard """
  cmd: '''nim c --newruntime $file'''
  output: '''
showing original type, length, and contents seq[int] 1 @[42]
copy length and contents 1 @[42]
'''
"""

proc test() =
  var sq1 = @[42]
  echo "showing original type, length, and contents ", sq1.typeof, " ", sq1.len, " ", sq1
  doAssert cast[int](sq1[0].unsafeAddr) != 0
  var sq2 = sq1 # copy of original
  echo "copy length and contents ", sq2.len, " ", sq2
  doAssert cast[int](sq2[0].unsafeAddr) != 0
  doAssert cast[int](sq1[0].unsafeAddr) != 0

test()
