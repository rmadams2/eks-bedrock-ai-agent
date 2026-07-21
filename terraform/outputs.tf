output "load_balancer_hostname" {
  description = "The public hostname of the AWS Network Load Balancer"
  value       = kubernetes_service.eval_agent_service.status[0].load_balancer[0].ingress[0].hostname
}