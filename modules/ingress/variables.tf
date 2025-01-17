variable "name" {
  type        = string
  description = "Name of the Ingress, must be unique."
}

variable "hostname" {
  type        = string
  default     = null
  description = "Host is the fully qualified domain name of a network host."
}

variable "scheme" {
  type        = string
  default     = "internet-facing"
  description = "Specifies whether your LoadBalancer will be internet facing."
}

variable "backend_protocol" {
  type        = string
  default     = "HTTP"
  description = "Specifies the protocol used when route traffic to pods."
}

variable "certificate_arn" {
  type        = string
  default     = ""
  description = "Specifies the ARN of one or more certificate managed by AWS Certificate Manager. If the alb.ingress.kubernetes.io/certificate-arn annotation is not specified, the controller will attempt to add certificates to listeners that require it by matching available certs from ACM with the host field in each listener's ingress rule."
}

variable "ssl_redirect" {
  type        = bool
  default     = true
  description = "Redirects HTTP traffic into HTTPs if set true."
}

variable "healthcheck_path" {
  type        = string
  default     = "/"
  description = "Specifies the HTTP path when performing health check on targets."
}

variable "ssl_policy" {
  type        = string
  default     = "ELBSecurityPolicy-2016-08"
  description = "Specifies the Security Policy that should be assigned to the ALB."
}

variable "load_balancer_attributes" {
  type        = string
  default     = ""
  description = "Specifies Load Balancer Attributes that should be applied to the ALB."
}

variable "healthcheck_success_codes" {
  type        = string
  default     = "200"
  description = "Specifies the HTTP status code that should be expected when doing health checks against the specified health check path."
}

variable "path" {
  type = list(object({
    name = string
    port = string
    path = string
  }))
  default     = null
  description = "Path array of path regex associated with a backend. Incoming urls matching the path are forwarded to the backend."
}

variable "default_backend" {
  type = object({
    service_name = string
    service_port = string
  })
  default = {
    service_name = null
    service_port = null
  }
}

variable "namespace" {
  type        = string
  default     = "default"
  description = "K8s namespace where the Ingress will be created."
}

variable "tls_hosts" {
  type        = list(string)
  default     = null
  description = "Hosts are a list of hosts included in the TLS certificate."
}
