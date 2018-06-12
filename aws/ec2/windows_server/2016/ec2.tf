resource "aws_instance" "windows_2016" {
  ami                           = "${data.aws_ami.windows_2016_base.id}"
  instance_type                 = "${var.ec2_instance_type}"
  key_name                      = "${var.ec2_key_name}"
  subnet_id                     = "${var.subnet_id}"
  vpc_security_group_ids        = ["${aws_security_group.ec2_windows_2016.id}"]
  associate_public_ip_address   = "${var.ec2_associate_public_ip_address}"
  monitoring                    = true
  iam_instance_profile          = "${aws_iam_instance_profile.ec2_windows_2016.id}"
  root_block_device {
    volume_type           = "gp2"
    volume_size           = "${var.ec2_root_volume_size}"
    delete_on_termination = true
  }
  user_data = <<EOF
<powershell>
net user ${var.ec2_user_name} "${var.ec2_password}" /add
net localgroup administrators ${var.ec2_user_name} /add
wmic UserAccount where "Name='${var.ec2_user_name}'" SET PasswordExpires=False
set-itemproperty -path hklm:\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\w32time\TimeProviders\NtpClient -name "SpecialPollInterval" -value "3600"
sc triggerinfo w32time delete
net start w32time
</powershell>
<script>
sc config w32time start= delayed-auto
</script>
EOF
  tags = "${var.tags}"
}
