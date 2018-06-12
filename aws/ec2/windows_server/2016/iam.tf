resource "aws_iam_instance_profile" "ec2_windows_2016" {
  name = "${var.ec2_instance_name}-ec2"
  role = "${aws_iam_role.ec2_windows_2016.name}"
}

resource "aws_iam_role" "ec2_windows_2016" {
  name                = "${var.ec2_instance_name}-ec2"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "", 
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}
