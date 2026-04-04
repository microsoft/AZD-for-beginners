# Capítulo 3: Configuração e Autenticação

**📚 Curso**: [AZD para Iniciantes](../../README.md) | **⏱️ Duração**: 45-60 minutos | **⭐ Complexidade**: Intermediário

---

## Visão Geral

Este capítulo aborda a configuração de ambientes, padrões de autenticação e práticas recomendadas de segurança para implantações com o Azure Developer CLI.

> Validado contra `azd 1.23.12` em março de 2026.

## Objetivos de Aprendizagem

Ao concluir este capítulo, você:
- Dominar a hierarquia de configuração do AZD
- Gerenciar múltiplos ambientes (dev, staging, prod)
- Implementar autenticação segura com identidades gerenciadas
- Configurar definições específicas por ambiente

---

## 📚 Aulas

| # | Aula | Descrição | Tempo |
|---|--------|-------------|------|
| 1 | [Guia de Configuração](configuration.md) | Configuração e gerenciamento do ambiente | 30 min |
| 2 | [Autenticação e Segurança](authsecurity.md) | Padrões de identidade gerenciada e RBAC | 30 min |

---

## 🚀 Início Rápido

```bash
# Criar múltiplos ambientes
azd env new dev
azd env new staging
azd env new prod

# Alternar ambientes
azd env select prod

# Definir variáveis de ambiente
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Visualizar configuração
azd env get-values
```

---

## 🔧 Hierarquia de Configuração

AZD aplica as configurações nesta ordem (itens posteriores sobrescrevem os anteriores):

1. **Valores padrão** (incorporados aos modelos)
2. **azure.yaml** (configuração do projeto)
3. **Variáveis de ambiente** (`azd env set`)
4. **Opções de linha de comando** (`--location eastus`)

---

## 🔐 Práticas recomendadas de segurança

```bash
# Use identidade gerenciada (recomendado)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Verifique o status de autenticação do AZD
azd auth status

# Opcional: verifique o contexto do Azure CLI se planeja executar comandos az
az account show

# Reautentique-se se necessário
azd auth login

# Opcional: atualize a autenticação do Azure CLI para os comandos az
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

- [Verificações pré-implantação](../chapter-06-pre-deployment/README.md)
- [Solução de Problemas](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->