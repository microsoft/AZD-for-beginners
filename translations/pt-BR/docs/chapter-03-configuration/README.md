# Capítulo 3: Configuração e Autenticação

**📚 Curso**: [AZD Para Iniciantes](../../README.md) | **⏱️ Duração**: 90-150 minutos incluindo prática de integração | **⭐ Complexidade**: Intermediário

---

## Visão Geral

Este capítulo cobre configuração de ambiente, padrões de autenticação e melhores práticas de segurança para implantações Azure Developer CLI.

> Alvo da revisão de comando e configuração: `azd 1.37.2` (novembro de 2026). O provisionamento Azure ao vivo não foi executado durante a revisão.

## Objetivos de Aprendizagem

Ao concluir este capítulo, você irá:
- Dominar a hierarquia de configuração do AZD
- Gerenciar múltiplos ambientes (dev, staging, prod)
- Implementar autenticação segura com identidades gerenciadas
- Configurar definições específicas do ambiente

---

## 📚 Lições

| # | Lição | Descrição | Tempo |
|---|--------|-------------|------|
| 1 | [Guia de Configuração](configuration.md) | Configuração e gerenciamento do ambiente | 30 min |
| 2 | [Autenticação e Segurança](authsecurity.md) | Padrões de identidade gerenciada e RBAC | 30 min |

---

## 🚀 Início Rápido

Execute a partir da raiz de uma **aplicação azd já inicializada**, não do repositório do curso. Use nomes de ambiente não usados caso estes já existam.

```bash
# Create multiple environments
azd env new dev
azd env new staging
azd env new prod

# Switch environments
azd env select prod

# Set environment variables
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# View configuration
azd env get-values
```

`SKU_NAME` é ilustrativo: afeta infraestrutura apenas se seu template explicitamente o consumir. Valores comuns `azd env set` são salvos localmente em texto sem formatação; não são armazenamento seguro de segredos.

---

## 🔧 Hierarquia de Configuração

Mantenha três superfícies de configuração separadas: preferências globais (`azd config`), estrutura do projeto (`azure.yaml`) e valores por ambiente (`azd env`). Flags substituem apenas as configurações que realmente suportam; não há sobreposição universal arbitrária de variáveis de ambiente no `azure.yaml` ou Bicep.

---

## 🔐 Melhores Práticas de Segurança

```bash
# Runtime managed identity must be enabled in infrastructure and granted RBAC.
# To authenticate azd itself on an Azure host with an assigned identity:
# azd auth login --managed-identity

# Check AZD authentication status
azd auth login --check-status

# Optional: verify Azure CLI context if you plan to run az commands
az account show

# Re-authenticate if needed
azd auth login

# Optional: refresh Azure CLI authentication for az commands
az login
```

---

## 🔗 Navegação

| Direção | Capítulo |
|-----------|---------|
| **Anterior** | [Capítulo 2: Desenvolvimento de IA](../chapter-02-ai-development/README.md) |
| **Próximo** | [Capítulo 4: Infraestrutura](../chapter-04-infrastructure/README.md) |

---

## 📖 Recursos Relacionados

- [Verificações Pré-Implantação](../chapter-06-pre-deployment/README.md)
- [Resolução de Problemas](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->