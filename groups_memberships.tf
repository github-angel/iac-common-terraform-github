resource "github_team_repository" "some_team_repo" {
  team_id    = github_team.some_team.id
  repository = github_repository.example.name
  permission = "maintain"
}

resource "github_team_membership" "some_team_membership" {
  team_id  = github_team_repository.some_team_repo.team_id
  username = "jthan24"
  role     = "maintainer"
}
