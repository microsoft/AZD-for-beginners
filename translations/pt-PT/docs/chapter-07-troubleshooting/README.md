# Capítulo 7: Resolução de Problemas e Debugging

**📚 Curso**: [AZD Para Iniciantes](../../README.md) | **⏱️ Duração**: 1-1.5 horas | **⭐ Complexidade**: Intermédio

---

## Visão Geral

Este capítulo ajuda a diagnosticar e resolver problemas comuns ao trabalhar com a Azure Developer CLI. Desde falhas de implementação a problemas específicos de IA.

> Orientação de comandos revista com base no `azd 1.37.2` de referência lançado. Implementações na cloud não foram executadas. Substitua nomes e IDs de recursos de exemplo antes de usar os comandos.

## Objetivos de Aprendizagem

Ao completar este capítulo, você vai:
- Diagnosticar falhas comuns de implementação AZD
- Depurar problemas de autenticação e permissões
- Resolver problemas de conectividade de serviços IA
- Usar o Azure Portal e CLI para resolução de problemas

---

## 📚 Lições

| # | Lição | Descrição | Tempo |
|---|--------|-------------|------|
| 1 | [Problemas Comuns](common-issues.md) | Problemas frequentemente encontrados | 30 min |
| 2 | [Guia de Debugging](debugging.md) | Estratégias passo a passo para depuração | 45 min |
| 3 | [Resolução de Problemas IA](ai-troubleshooting.md) | Problemas específicos de IA | 30 min |

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

### Falhas de Provisionamento
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Conflitos de Recursos
Inspecione primeiro os recursos existentes e erros de implementação. Não elimine um ambiente partilhado ou de produção para resolver um conflito de nomes. Para um **ambiente descartável novo**, use um nome único:

```bash
azd env new different-name
azd up
```

### Quota Excedida
```bash
az vm list-usage --location eastus --output table
# Check the affected service's own quotas, not just VM quotas.
# For a new environment only, choose a supported region with available quota.
```

Alterar `AZURE_LOCATION` não move os recursos existentes e pode causar conflitos de localização na reimplementação.

---

## 📋 Referência de Códigos de Erro

| Erro | Causa | Solução |
|-------|-------|----------|
| `AuthenticationError` | Não autenticado | `azd auth login` |
| `ResourceNotFound` | Recurso em falta | Verifique nomes dos recursos |
| `QuotaExceeded` | Limites da subscrição | Solicite aumento de quota |
| `InvalidTemplate` | Erro de sintaxe Bicep | `az bicep build` |
| `Conflict` | Recurso existe | Use novo nome ou elimine |
| `Forbidden` | Permissões insuficientes | Verifique funções RBAC |

---

## 🔄 Repor e Recuperar

```bash
# Soft reset (keep resources, redeploy code)
azd deploy

# Hard reset (delete everything, start fresh)
azd down
azd up
```

A reposição rígida apaga dados e pode alterar pontos finais. Faça backup primeiro e reveja os avisos interativos de eliminação. `--force --purge` é apropriado apenas para ambientes descartáveis quando se pretende eliminação irreversível.

---

## 🔗 Navegação

| Direção | Capítulo |
|-----------|---------|
| **Anterior** | [Capítulo 6: Pré-Implementação](../chapter-06-pre-deployment/README.md) |
| **Seguinte** | [Capítulo 8: Produção](../chapter-08-production/README.md) |

---

## 📖 Recursos Relacionados

- [Verificações Pré-Implementação](../chapter-06-pre-deployment/preflight-checks.md)
- [Guia de Configuração](../chapter-03-configuration/configuration.md)
- [Problemas no GitHub AZD](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->