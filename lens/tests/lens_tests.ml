open OUnit2

let suite = "Test lens" >::: [
    Regression_tests.suite;
  ]

let _ =
  run_test_tt_main suite
