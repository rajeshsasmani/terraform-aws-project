# terraform-aws-project-implement
creating aws infrastructure with terraform

## AI-assisted Terraform workflow

Use the **Terraform Infrastructure** Copilot agent to make code changes on a feature branch. It must submit changes for human review through a pull request and must not access credentials or apply infrastructure.

The pull-request workflow runs Terraform formatting and validation. The VPC workspace should use `aws-vpc-project/examples/basic`; Terraform Cloud runs its plan through the existing GitHub connection after code changes. Review and merge the pull request, then review the Terraform Cloud plan and approve apply there as a separate step.

Keep AWS credentials in Terraform Cloud as sensitive environment variables or use approved dynamic credentials. Never store them in this repository.
