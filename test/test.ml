(* The tests *)
let increment_base32_1 () = 
  Alcotest.(check string) "increments correctly" "A109D" (Ulid.increment_base_32("A109C"))

let increment_base32_2 () =
  Alcotest.(check string) "carries correctly" "A1Z00" (Ulid.increment_base_32("A1YZZ"))
  
let increment_base32_3 () =
  Alcotest.(check string) "double increments correctly" "A1Z01" (Ulid.increment_base_32("A1YZZ"))

let test_set_1 = [
  "base 32 increment increments correctly", `Quick, increment_base32_1;
  "base 32 increment carries correctly", `Quick, increment_base32_2;
  "base 32 increment double increments correctly", `Quick, increment_base32_3;
]

let encode_time_1 () =
  Alcotest.(check string) "encodes properly" "01ARYZ6S41" (Ulid.encode_time 1469918176385 10)

let test_set_2 = [
  "encode time encodes properly", `Quick, encode_time_1;
]

(* Run it *)
let () =
  Alcotest.run "ULID tests" [
    (* "base 32 increment", test_set; *)
    "encode time", test_set_2;
  ]