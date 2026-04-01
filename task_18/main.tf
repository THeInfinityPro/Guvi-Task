provider "aws" {
    region = "us-east-1"
    alias = "useast1"
}

provider "aws" {
    region = "eu-central-1"
    alias = "eucentral1"
}

resource "aws_instance" "terraform_instance_us"{
    provider = aws.useast1
    instance_type = "m7i-flex.large"
    ami = "ami-0ec10929233384c7f"
    
    user_data = file("tools-install.sh")
}

resource "aws_instance" "terraform_instance_eu"{
    provider = aws.eucentral1
    instance_type = "m7i-flex.large"
    ami = "ami-0ec10929233384c7f"

    user_data = file("tools-install.sh")
}