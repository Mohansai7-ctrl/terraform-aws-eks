#Root module is terraform-aws-security-group




#creating bastion server security group, bastion server is for internal/organization employees/users to connect to servers via bastion via organization network instead of public network:
module "bastion_sg" {
    source = "git::https://github.com/Mohansai7-ctrl/terraform-aws-security-group.git?ref=main"
    vpc_id = local.vpc_id
    project_name = var.project_name
    environment = var.environment
    common_tags = var.common_tags
    sg_name = "bastion"
    sg_tags = var.bastion_sg_tags
}



#Here to troubleshoot any issues, organization employees can connect via bastion to access servers, here the actual cidr block should be organization IP.
resource "aws_security_group_rule" "bastion_public" {
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  #As source here is Public, we need to use cidr block instead of security group
    security_group_id = module.bastion_sg.id
}




