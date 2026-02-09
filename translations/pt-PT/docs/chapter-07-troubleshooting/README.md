# Capítulo 7: Resolução de Problemas e Depuração

**📚 Curso**: [AZD para Principiantes](../../README.md) | **⏱️ Duração**: 1-1.5 horas | **⭐ Complexidade**: Intermédio

---

## Visão Geral

Este capítulo ajuda a diagnosticar e resolver problemas comuns ao trabalhar com o Azure Developer CLI. Desde falhas de implantação a problemas específicos de IA.

## Objetivos de Aprendizagem

Ao completar este capítulo, irá:
- Diagnosticar falhas comuns de deployment do AZD
- Depurar problemas de autenticação e permissões
- Resolver problemas de conectividade de serviços de IA
- Usar o Azure Portal e a CLI para diagnóstico

---

## 📚 Lições

| # | Lição | Descrição | Tempo |
|---|--------|-------------|------|
| 1 | [Problemas Comuns](common-issues.md) | Problemas frequentemente encontrados | 30 min |
| 2 | [Guia de Depuração](debugging.md) | Estratégias de depuração passo a passo | 45 min |
| 3 | [Resolução de Problemas de IA](ai-troubleshooting.md) | Problemas específicos de IA | 30 min |

---

## 🚨 Correções Rápidas

### Problemas de Autenticação
```bash
azd auth login
az login
azd auth whoami
```

### Falhas de Provisionamento
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Conflitos de Recursos
```bash
azd down --force --purge
azd env new different-name
azd up
```

### Cota Excedida
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 Referência de Códigos de Erro

| Erro | Causa | Solução |
|-------|-------|----------|
| `AuthenticationError` | Não autenticado | `azd auth login` |
| `ResourceNotFound` | Recurso em falta | Verificar nomes de recurso |
| `QuotaExceeded` | Limites da subscrição | Solicitar aumento de quota |
| `InvalidTemplate` | Erro de sintaxe Bicep | `az bicep build` |
| `Conflict` | O recurso já existe | Usar um novo nome ou eliminar |
| `Forbidden` | Permissões insuficientes | Verificar funções RBAC |

---

## 🔄 Repor e Recuperação

```bash
# Reinício suave (manter recursos, reimplantar o código)
azd deploy --force

# Reinício completo (eliminar tudo, começar de novo)
azd down --force --purge
azd up
```

---

## 🔗 Navegação

| Direção | Capítulo |
|-----------|---------|
| **Anterior** | [Chapter 6: Pre-Deployment](../chapter-06-pre-deployment/README.md) |
| **Seguinte** | [Chapter 8: Production](../chapter-08-production/README.md) |

---

## 📖 Recursos Relacionados

- [Pre-Deployment Checks](../chapter-06-pre-deployment/preflight-checks.md)
- [Configuration Guide](../chapter-03-configuration/configuration.md)
- [Problemas do AZD no GitHub](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Isenção de responsabilidade**:
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se a tradução profissional por um tradutor humano. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->