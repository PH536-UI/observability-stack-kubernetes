cd ~/observability-stack-kubernetes 2>/dev/null || git clone https://github.com/PH536-UI/observability-stack-kubernetes.git ~/observability-stack-kubernetes
cd ~/observability-stack-kubernetes
cat > README.md << 'EOF'
# 📊 observability-stack-kubernetes

### 🇧🇷 PT-BR
Stack de observabilidade para Kubernetes - Prometheus + Grafana + Alertmanager
Simula ambiente produtivo local.

### 🇺🇸 EN
Kubernetes observability stack - Local prod-like monitoring.

Stack: Kubernetes | Prometheus | Grafana | Docker
Author: Paulo Henrique | SRE | 4x AWS Certified
EOF
git add README.md && git commit -m "docs: bilingual" && git push
