# Capítulo 7: Solução de Problemas e Depuração

**📚 Curso**: [AZD Para Iniciantes](../../README.md) | **⏱️ Duração**: 1-1.5 horas | **⭐ Complexidade**: Intermediário

---

## Visão Geral

Este capítulo ajuda você a diagnosticar e resolver problemas comuns ao trabalhar com o Azure Developer CLI. Desde falhas na implantação até problemas específicos de IA.

> Orientação de comandos revisada com base na referência `azd 1.37.2` lançada. Implantações na nuvem não foram executadas. Substitua nomes e IDs de recursos de exemplo antes de usar os comandos.

## Objetivos de Aprendizagem

Ao concluir este capítulo, você irá:
- Diagnosticar falhas comuns de implantação no AZD
- Depurar problemas de autenticação e permissões
- Resolver problemas de conectividade dos serviços de IA
- Usar o Azure Portal e CLI para solução de problemas

---

## 📚 Lições

| # | Lição | Descrição | Tempo |
|---|--------|-------------|------|
| 1 | [Problemas Comuns](common-issues.md) | Problemas frequentes encontrados | 30 min |
| 2 | [Guia de Depuração](debugging.md) | Estratégias passo a passo para depuração | 45 min |
| 3 | [Solução de Problemas em IA](ai-troubleshooting.md) | Problemas específicos de IA | 30 min |

---

## 🚨 Correções Rápidas

### Problemas de Autenticação
```bash
# Required for AZD workflows
azd auth login

# Optional if you are also using Azure CLI commands directly
az login

azd auth login --check-status
```

### Falhas na Provisão
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Conflitos de Recursos
Inspecione os recursos existentes e erros de implantação primeiro. Não exclua um ambiente compartilhado ou de produção para resolver um conflito de nomes. Para um **novo ambiente descartável**, use um nome exclusivo:

```bash
azd env new different-name
azd up
```

### Cota Excedida
```bash
az vm list-usage --location eastus --output table
# Check the affected service's own quotas, not just VM quotas.
# For a new environment only, choose a supported region with available quota.
```

Alterar `AZURE_LOCATION` não move recursos existentes e pode causar conflitos de localização na reimplantação.

---

## 📋 Referência de Códigos de Erro

| Erro | Causa | Solução |
|-------|-------|----------|
| `AuthenticationError` | Não autenticado | `azd auth login` |
| `ResourceNotFound` | Recurso ausente | Verifique nomes dos recursos |
| `QuotaExceeded` | Limites da assinatura | Solicite aumento de cota |
| `InvalidTemplate` | Erro de sintaxe no Bicep | `az bicep build` |
| `Conflict` | Recurso já existe | Use nome novo ou exclua |
| `Forbidden` | Permissões insuficientes | Verifique papéis RBAC |

---

## 🔄 Reinicialização e Recuperação

```bash
# Soft reset (keep resources, redeploy code)
azd deploy

# Hard reset (delete everything, start fresh)
azd down
azd up
```

A reinicialização completa exclui dados e pode alterar endpoints. Faça backup primeiro e revise os prompts interativos de exclusão. `--force --purge` é apropriado somente para ambientes descartáveis quando a exclusão irreversível é desejada.

---

## 🔗 Navegação

| Direção | Capítulo |
|-----------|---------|
| **Anterior** | [Capítulo 6: Pré-Implantação](../chapter-06-pre-deployment/README.md) |
| **Próximo** | [Capítulo 8: Produção](../chapter-08-production/README.md) |

---

## 📖 Recursos Relacionados

- [Verificações Pré-Implantação](../chapter-06-pre-deployment/preflight-checks.md)
- [Guia de Configuração](../chapter-03-configuration/configuration.md)
- [Problemas do AZD no GitHub](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->