# Capítulo 3: Configuração & Autenticação

**📚 Curso**: [AZD Para Iniciantes](../../README.md) | **⏱️ Duração**: 45-60 minutos | **⭐ Complexidade**: Intermédio

---

## Visão Geral

Este capítulo aborda a configuração do ambiente, padrões de autenticação e melhores práticas de segurança para implementações com Azure Developer CLI.

> Validado com `azd 1.23.12` em março de 2026.

## Objetivos de Aprendizagem

Ao concluir este capítulo, irá:
- Dominar a hierarquia de configuração do AZD
- Gerir múltiplos ambientes (dev, staging, prod)
- Implementar autenticação segura com identidades geridas
- Configurar definições específicas para cada ambiente

---

## 📚 Lições

| # | Lição | Descrição | Duração |
|---|--------|-------------|------|
| 1 | [Guia de Configuração](configuration.md) | Configuração e gestão do ambiente | 30 min |
| 2 | [Autenticação & Segurança](authsecurity.md) | Padrões de identidade gerida e RBAC | 30 min |

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

# Ver configuração
azd env get-values
```

---

## 🔧 Hierarquia de Configuração

O AZD aplica definições nesta ordem (o último sobrepõe o anterior):

1. **Valores predefinidos** (incorporados nos modelos)
2. **azure.yaml** (configuração do projeto)
3. **Variáveis de ambiente** (`azd env set`)
4. **Flags da linha de comando** (`--location eastus`)

---

## 🔐 Melhores Práticas de Segurança

```bash
# Use identidade gerida (recomendado)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Verificar estado de autenticação AZD
azd auth status

# Opcional: verificar contexto Azure CLI se planeia executar comandos az
az account show

# Reautenticar se necessário
azd auth login

# Opcional: atualizar autenticação Azure CLI para comandos az
az login
```

---

## 🔗 Navegação

| Direção | Capítulo |
|---------|-----------|
| **Anterior** | [Capítulo 2: Desenvolvimento AI](../chapter-02-ai-development/README.md) |
| **Seguinte** | [Capítulo 4: Infraestrutura](../chapter-04-infrastructure/README.md) |

---

## 📖 Recursos Relacionados

- [Verificações Pré-Implementação](../chapter-06-pre-deployment/README.md)
- [Resolução de Problemas](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, por favor tenha em conta que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->