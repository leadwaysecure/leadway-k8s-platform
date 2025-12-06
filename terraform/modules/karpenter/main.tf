resource "kubernetes_manifest" "karpenter_nodepool" {
  manifest = yamldecode(file("${path.module}/nodepool.yaml"))
}

# Example NodePool (the one I used for prod)
apiVersion: karpenter.sh/v1
kind: NodePool
metadata:
  name: prod-core
spec:
  template:
    spec:
      nodeClassRef:
        name: default
      requirements:
        - key: karpenter.sh/capacity-type
          operator: In
          values: ["on-demand"]
      taints:
        - key: CriticalAddonsOnly
          value: "true"
          effect: NoSchedule
  disruption:
    consolidationPolicy: WhenUnderutilized
