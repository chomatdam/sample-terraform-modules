module "greeting" {
  source = "../.."

  name = "world"
}

output "message" {
  value = module.greeting.message
}
