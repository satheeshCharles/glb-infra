resource "aws_subnet" "glb_subnet" {
  vpc_id            = "${aws_vpc.glb_vpc.id}"
  count             = "${length(local.av_zone)}"
  cidr_block        = "${cidrsubnet(var.cidr-block, 8, count.index)}"
  availability_zone = "${local.av_zone[count.index]}"
  tags = {
    Name = "busybox-${count.index}"
  }
}
