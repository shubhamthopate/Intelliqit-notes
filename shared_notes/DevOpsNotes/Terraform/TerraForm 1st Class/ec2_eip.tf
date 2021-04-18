provider aws
{
 access_key="AKIAJKZ6IQM6AIGBHTNA"
 secret_key="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"
 region="ap-southeast-1"
}

variable "insttype" {
  type = "string"
}

resource aws_instance "myec2"
{
   ami ="ami-0c5199d385b432989"
   instance_type="${var.insttype}"
   key_name="dec24"    
   
}
resource aws_eip "myeip"
{
  instance="${aws_instance.myec2.id}"
}
resource aws_ebs_snapshot "mysnap"
{
   volume_id="vol-046976b8528057d92"
}
resource aws_ebs_volume "snapshotvol"
{
  snapshot_id="${aws_ebs_snapshot.mysnap.id}"
  availability_zone="ap-southeast-1b"
  size=20
  type="gp2"
}








