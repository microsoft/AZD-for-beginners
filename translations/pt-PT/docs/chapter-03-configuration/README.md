# Capítulo 3: Configuração e Autenticação

**📚 Curso**: [AZD For Beginners](../../README.md) | **⏱️ Duração**: 45-60 minutos | **⭐ Complexidade**: Intermédio

---

## Visão geral

Este capítulo aborda a configuração de ambientes, padrões de autenticação e as melhores práticas de segurança para implementações com o Azure Developer CLI.

## Objetivos de Aprendizagem

Ao concluir este capítulo, irá:
- Dominar a hierarquia de configuração do AZD
- Gerir múltiplos ambientes (dev, staging, prod)
- Implementar autenticação segura com identidades geridas
- Configurar definições específicas por ambiente

---

## 📚 Lições

| # | Lição | Descrição | Tempo |
|---|--------|-------------|------|
| 1 | [Guia de Configuração](configuration.md) | Configuração e gestão do ambiente | 30 min |
| 2 | [Autenticação e Segurança](authsecurity.md) | Padrões de identidade gerida e RBAC | 30 min |

---

## 🚀 Início Rápido

```bash
# Criar vários ambientes
azd env new dev
azd env new staging
azd env new prod

# Alternar ambientes
azd env select prod

# Definir variáveis de ambiente
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Ver configuração
azd env get-values
```

---

## 🔧 Hierarquia de Configuração

O AZD aplica definições nesta ordem (os itens posteriores substituem os anteriores):

1. **Valores predefinidos** (incorporados nos templates)
2. **azure.yaml** (configuração do projeto)
3. **Variáveis de ambiente** (`azd env set`)
4. **Flags de linha de comando** (`--location eastus`)

---

## 🔐 Melhores Práticas de Segurança

```bash
# Utilizar identidade gerida (recomendado)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Verificar o estado da autenticação
azd auth whoami
az account show

# Reautenticar se necessário
azd auth login
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

- [Verificações pré-implantação](../chapter-06-pre-deployment/README.md)
- [Resolução de Problemas](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Isenção de responsabilidade**:
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos por garantir a precisão, esteja ciente de que as traduções automatizadas podem conter erros ou imprecisões. O documento original, na sua língua de origem, deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se a tradução por um tradutor humano profissional. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->