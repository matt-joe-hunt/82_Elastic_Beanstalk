provider "aws" {
  region = "eu-west-2"
}

resource "aws_elastic_beanstalk_application" "application" {
  name        = "82_application"
}

resource "aws_elastic_beanstalk_environment" "environment" {
  name                = "82_environment"
  application         = aws_elastic_beanstalk_application.application.name
  solution_stack_name = "64bit Amazon Linux 2 v3.2.1 running Python 3.8 "
  setting {
        namespace = "aws:autoscaling:launchconfiguration"
        name      = "IamInstanceProfile"
        value     = "aws-elasticbeanstalk-ec2-role"
      }
}