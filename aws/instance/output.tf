output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}
output "public_instance_ip" {
  value =  ["${aws_instance.Server.*.public_ip}"]
}