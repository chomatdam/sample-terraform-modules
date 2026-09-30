run "default_prefix" {
  command = plan

  variables {
    name = "world"
  }

  assert {
    condition     = output.message == "Hello, world!"
    error_message = "message should use the default prefix"
  }
}

run "custom_prefix" {
  command = plan

  variables {
    name   = "world"
    prefix = "Hi"
  }

  assert {
    condition     = output.message == "Hi, world!"
    error_message = "message should use the given prefix"
  }
}

run "rejects_empty_name" {
  command = plan

  variables {
    name = ""
  }

  expect_failures = [var.name]
}
