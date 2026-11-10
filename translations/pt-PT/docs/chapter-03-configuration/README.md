# Capítulo 3: Configuração & Autenticação

**📚 Curso**: [AZD Para Iniciantes](../../README.md) | **⏱️ Duração**: 90-150 minutos incluindo prática de integração | **⭐ Complexidade**: Intermédio

---

## Visão Geral

Este capítulo abrange a configuração do ambiente, padrões de autenticação e melhores práticas de segurança para as implementações do Azure Developer CLI.

> Alvo de revisão do comando e configuração: `azd 1.37.2` (novembro 2026). O provisionamento ativo no Azure não foi executado durante a revisão.

## Objetivos de Aprendizagem

Ao completar este capítulo, você irá:
- Dominar a hierarquia de configuração do AZD
- Gerir múltiplos ambientes (dev, staging, prod)
- Implementar autenticação segura com identidades geridas
- Configurar definições específicas para cada ambiente

---

## 📚 Lições

| # | Lição | Descrição | Tempo |
|---|--------|-------------|------|
| 1 | [Guia de Configuração](configuration.md) | Configuração e gestão do ambiente | 30 min |
| 2 | [Autenticação & Segurança](authsecurity.md) | Padrões de identidade gerida e RBAC | 30 min |

---

## 🚀 Início Rápido

Execute a partir da raiz de uma **aplicação azd já inicializada**, não do repositório do curso. Use nomes de ambiente não usados se estes já existirem.

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

`SKU_NAME` é ilustrativo: afeta a infraestrutura apenas se o seu template o consumir explicitamente. Valores ordinários de `azd env set` são guardados localmente em texto claro; não constituem armazenamento seguro de segredos.

---

## 🔧 Hierarquia de Configuração

Mantenha três superfícies diferentes de configuração separadas: preferências globais (`azd config`), estrutura do projeto (`azure.yaml`), e valores por ambiente (`azd env`). Flags sobrepõem apenas as definições que suportam; não existe uma sobreposição universal de variáveis de ambiente arbitrárias sobre `azure.yaml` ou Bicep.

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
| **Seguinte** | [Capítulo 4: Infraestrutura](../chapter-04-infrastructure/README.md) |

---

## 📖 Recursos Relacionados

- [Verificações Pré-Implementação](../chapter-06-pre-deployment/README.md)
- [Resolução de Problemas](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->