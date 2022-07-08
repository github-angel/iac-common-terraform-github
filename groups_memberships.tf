resource "github_team_membership" "some_team_membership" {
  team_id  = github_team.some_team.id
  username = "jthan24"
  role     = "maintainer"
}


resource "github_team_repository" "some_team_repo" {
  team_id    = github_team.github_team.some_team.id
  repository = github_team.github_repository.some_repo.name
  permission = "maintain"
}
