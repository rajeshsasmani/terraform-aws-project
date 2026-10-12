# Repository Instructions

- Keep infrastructure changes in a feature branch and submit them as a pull request. Never write directly to `main` or merge a pull request.
- Treat Terraform Cloud as the source of remote state and plan/apply execution. The VPC workspace uses `aws-vpc-project/examples/basic`; the EC2 root is `terraform-ec2-creation`.
- Keep AWS credentials, Terraform Cloud tokens, state files, and other secrets out of source code, logs, and pull requests. Credentials belong in Terraform Cloud's sensitive environment variables or approved dynamic credentials.
- Run the Terraform validation workflow for Terraform changes. A Terraform Cloud plan is review-only until a human approves apply in Terraform Cloud.
- Never run `terraform apply`, `destroy`, `import`, state-mutating commands, or approve a Terraform Cloud apply.