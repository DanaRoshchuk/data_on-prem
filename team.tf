resource "scalr_iam_team" "team" {
  name        = "after-migration-${count.index}"
   count = 1
  description = "Regression ${formatdate("DDMMYYYY", timestamp())}"
}
