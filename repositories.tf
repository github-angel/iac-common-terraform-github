resource "github_repository" "template" {
  name        = "iac-common-terraform-github-template"
  description = "Repositorio plantilla de Terraform"
  is_template = true
  visibility  = "private"
}

resource "github_repository" "example" {
  name        = "iac-common-terraform-github"
  description = "My awesome codebase"

  visibility = "public"
  template {
    owner      = var.organizacion
    repository = github_repository.template.name
  }
}

resource "github_branch" "main" {
  repository = github_repository.example.name
  branch     = var.branches[count.index]
}

resource "github_branch_default" "default" {
  repository = github_repository.example.name
  branch     = github_branch.main.branch
}

# Protect the main branch of the foo repository. Additionally, require that
# the "ci/travis" context to be passing and only allow the engineers team merge
# to the branch.

resource "github_branch_protection" "branch_protection" {
  repository_id = github_repository.example.node_id
  # also accepts repository name
  # repository_id  = github_repository.example.name

  pattern          = "main"
  enforce_admins   = true
  allows_deletions = true

  required_pull_request_reviews {
    #dismiss_stale_reviews           = true
    #restrict_dismissals             = true
    required_approving_review_count = 1
  }
}

