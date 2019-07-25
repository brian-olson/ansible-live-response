# This will list all public IP addresses from your account using your AWS keys (awscli)
aws ec2 describe-instances   --query "Reservations[*].Instances[*].PublicIpAddress"   --output=text  | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}"
