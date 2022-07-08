# Add a team to the organization
resource "github_team" "some_team" {
  name        = "devops-team"
  description = "Some cool team"
  privacy     = "secret"
}
