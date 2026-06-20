# Chapter 7: Resolução de Problemas e Depuração

**📚 Curso**: [AZD Para Iniciantes](../../README.md) | **⏱️ Duração**: 1-1.5 horas | **⭐ Complexidade**: Intermédio

---

## Visão Geral

Este capítulo ajuda-o a diagnosticar e resolver problemas comuns ao trabalhar com o Azure Developer CLI. Desde falhas de implantação a problemas específicos de IA.

> Validado contra `azd 1.25.6` em junho de 2026.

## Objetivos de Aprendizagem

Ao completar este capítulo, irá:
- Diagnosticar falhas comuns de implantação AZD
- Depurar problemas de autenticação e permissões
- Resolver problemas de conectividade de serviços de IA
- Utilizar o Portal Azure e CLI para resolução de problemas

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
# Necessário para fluxos de trabalho AZD
azd auth login

# Opcional se também estiver a usar comandos Azure CLI diretamente
az login

azd auth status
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

### Quota Excedida
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
| `ResourceNotFound` | Recurso em falta | Verifique os nomes dos recursos |
| `QuotaExceeded` | Limites da subscrição | Solicite aumento da quota |
| `InvalidTemplate` | Erro de sintaxe Bicep | `az bicep build` |
| `Conflict` | Recurso já existe | Utilize um nome novo ou elimine |
| `Forbidden` | Permissões insuficientes | Verifique os papéis RBAC |

---

## 🔄 Repor e Recuperar

```bash
# Reinício suave (manter recursos, reimplantar código)
azd deploy --force

# Reinício completo (apagar tudo, começar de novo)
azd down --force --purge
azd up
```

---

## 🔗 Navegação

| Direção | Capítulo |
|-----------|---------|
| **Anterior** | [Capítulo 6: Pré-Implantação](../chapter-06-pre-deployment/README.md) |
| **Seguinte** | [Capítulo 8: Produção](../chapter-08-production/README.md) |

---

## 📖 Recursos Relacionados

- [Verificações Pré-Implantação](../chapter-06-pre-deployment/preflight-checks.md)
- [Guia de Configuração](../chapter-03-configuration/configuration.md)
- [Problemas AZD no GitHub](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->