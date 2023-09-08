let allocate_c_string ?(count = 1014) () =
  let size = Unsigned.Size_t.of_int count in
  let errstr = Ctypes.allocate_n Ctypes.char ~count in
  (errstr, size)
