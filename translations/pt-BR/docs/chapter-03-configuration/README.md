# Capítulo 3: Configuração & Autenticação

**📚 Curso**: [AZD Para Iniciantes](../../README.md) | **⏱️ Duração**: 45-60 minutos | **⭐ Complexidade**: Intermediário

---

## Visão Geral

Este capítulo aborda a configuração de ambiente, padrões de autenticação e melhores práticas de segurança para implantações com o Azure Developer CLI.

## Objetivos de Aprendizagem

Ao completar este capítulo, você irá:
- Dominar a hierarquia de configuração do AZD
- Gerenciar múltiplos ambientes (dev, staging, prod)
- Implementar autenticação segura com identidades gerenciadas
- Configurar definições específicas por ambiente

---

## 📚 Lições

| # | Lição | Descrição | Tempo |
|---|--------|-------------|------|
| 1 | [Guia de Configuração](configuration.md) | Configuração e gerenciamento do ambiente | 30 min |
| 2 | [Autenticação & Segurança](authsecurity.md) | Identidade gerenciada e padrões de RBAC | 30 min |

---

## 🚀 Início Rápido

```bash
# Criar vários ambientes
azd env new dev
azd env new staging
azd env new prod

# Alternar entre ambientes
azd env select prod

# Definir variáveis de ambiente
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Visualizar configuração
azd env get-values
```

---

## 🔧 Hierarquia de Configuração

O AZD aplica configurações nesta ordem (as posteriores substituem as anteriores):

1. **Valores padrão** (embutidos nos modelos)
2. **azure.yaml** (configuração do projeto)
3. **Variáveis de ambiente** (`azd env set`)
4. **Opções de linha de comando** (`--location eastus`)

---

## 🔐 Melhores Práticas de Segurança

```bash
# Use identidade gerenciada (recomendado)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Verifique o status de autenticação
azd auth whoami
az account show

# Reautentique-se se necessário
azd auth login
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
- [Solução de Problemas](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Isenção de responsabilidade**:
Este documento foi traduzido utilizando o serviço de tradução por inteligência artificial [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se tradução profissional realizada por tradutores humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->