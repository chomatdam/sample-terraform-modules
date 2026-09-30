run "joins_with_default_separator" {
  command = plan

  variables {
    project     = "sample"
    environment = "dev"
  }

  assert {
    condition     = output.name == "sample-dev"
    error_message = "name should join project and environment with a dash"
  }
}

run "lowercases_input" {
  command = plan

  variables {
    project     = "Sample"
    environment = "DEV"
  }

  assert {
    condition     = output.name == "sample-dev"
    error_message = "name should be lowercase"
  }
}

run "uses_custom_separator" {
  command = plan

  variables {
    project     = "sample"
    environment = "dev"
    separator   = "_"
  }

  assert {
    condition     = output.name == "sample_dev"
    error_message = "name should use the given separator"
  }
}

run "rejects_empty_project" {
  command = plan

  variables {
    project     = ""
    environment = "dev"
  }

  expect_failures = [var.project]
}

run "rejects_empty_environment" {
  command = plan

  variables {
    project     = "sample"
    environment = ""
  }

  expect_failures = [var.environment]
}
