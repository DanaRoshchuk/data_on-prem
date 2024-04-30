resource "scalr_iam_team" "team" {
  name        = "auto_empty_team_${formatdate("DDMMYYYY", timestamp())}"
  description = "Generated by provider on: ${formatdate("DDMMYYYY", timestamp())}"
}

resource "scalr_role" "role" {
  name        = "auto_admin_role_${formatdate("DDMMYYYY", timestamp())}"
  description = "Generated by provider. Has all :create, :read, :update and :delete permissions"

  permissions = [
    "*:read",
    "*:update",
    "*:delete",
    "*:create"
  ]
}

resource "scalr_access_policy" "access-policy" {
  subject {
    type = "team"
    id   = scalr_iam_team.team.id
  }
  scope {
    type = "workspace"
    id   = scalr_workspace.ws_vcs.id
  }

  role_ids = [
    scalr_role.role.id
  ]
}

resource "scalr_service_account" "no_permissions_service_acc" {
  name   = "service-account-${formatdate("DDMMYYYY", timestamp())}"
  status = "Active"
}
/*resource "scalr_service_account" "service_acc" {
  name   = "sa-${formatdate("DDMMYYYY", timestamp())}"
  status = "Active"
}*/

resource "scalr_service_account" "service_acc" {
  name   = "new-${formatdate("DDMMYYYY", timestamp())}"
  status = "Active"
}
