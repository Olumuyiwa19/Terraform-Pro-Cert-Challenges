
provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias      = "local"
  access_key = "AKIAEXAMPLEEXAMPLE"
  secret_key = "EueEXAMPLEEXAMPLEEXAMPLEEXAMPLEEXAMPLE"
  assume_role {
    role_arn     = "arn:aws:iam::000000000000:role/ReadOnlyRole"
    session_name = "ReadOnlyRole"
  }

}

provider "aws" {
  alias                    = "asg"
  profile                  = "asg"
  shared_config_files      = [".aws/conf"]
  shared_credentials_files = [".aws/credentials"]
}

provider "aws" {
  alias                    = "iam"
  profile                  = "iam"
  shared_config_files      = [".aws/conf"]
  shared_credentials_files = [".aws/credentials"]
}
