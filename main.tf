#Create IAM role for GLue Service 
resource "aws_iam_role" "glue" {
  name = "AWSGlueServiceRoleDefault1"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "glue.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "glue_service" {
  role       = "${aws_iam_role.glue.id}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"
}

resource "aws_iam_role_policy" "my_s3_policy" {
  name = "my_s3_policy"
  role = "${aws_iam_role.glue.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:*"
      ],
      "Resource": [
        "arn:aws:s3:::*",
        "arn:aws:s3:::*"
      ]
    }
  ]
}
EOF
}

#Create IAM role for Redshift Service 

resource "aws_iam_role" "redshift" {
  name = "AWSREDSHIFT"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "redshift.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "redshift_service" {
  role       = "${aws_iam_role.redshift.id}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonRedshiftFullAccess"
}

resource "aws_iam_role_policy" "s3_policy" {
  name = "s3_policy"
  role = "${aws_iam_role.redshift.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:*"
      ],
      "Resource": [
        "arn:aws:s3:::*",
        "arn:aws:s3:::*"
      ]
    }
  ]
}
EOF
}
