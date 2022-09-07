data "template_file" "slave_task_template" {
  template = file("templates/jenkins_slave.json.tpl")
}

resource "aws_ecs_task_definition" "slave" {
  family                = "slave"
  container_definitions = data.template_file.slave_task_template.rendered

  # volume {
  #   name      = "jenkins-home"
  #   host_path = "/ecs/jenkins-home"
  # }
}

resource "aws_ecs_service" "slave" {
  name            = "slave"
  cluster         = aws_ecs_cluster.jenkins.id
  task_definition = aws_ecs_task_definition.slave.arn
  desired_count   = var.desired_service_count
  depends_on      = [aws_autoscaling_group.asg_jenkins]
}


