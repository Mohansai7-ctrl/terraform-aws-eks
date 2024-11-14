resource "aws_ssm_parameter" "ingress_alb_listener_arn" {
    name = "${var.project_name}/${var.environment}/ingress_alb_listener_arn"
    value = aws_lb_listener.http.arn
    type = "String"
}