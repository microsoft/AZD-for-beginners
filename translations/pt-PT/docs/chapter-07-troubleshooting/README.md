# Capítulo 7: Resolução de Problemas & Debugging

**📚 Curso**: [AZD Para Principiantes](../../README.md) | **⏱️ Duração**: 1-1.5 horas | **⭐ Complexidade**: Intermédio

---

## Visão Geral

Este capítulo ajuda-o a diagnosticar e resolver problemas comuns ao trabalhar com o Azure Developer CLI. Desde falhas de implantação a problemas específicos de IA.

> Validado contra `azd 1.27.1` em julho de 2026.

## Objetivos de Aprendizagem

Ao completar este capítulo, você irá:
- Diagnosticar falhas comuns de implantação AZD
- Depurar problemas de autenticação e permissões
- Resolver problemas de conectividade do serviço de IA
- Usar o Azure Portal e CLI para resolução de problemas

---

## 📚 Lições

| # | Lição | Descrição | Tempo |
|---|--------|-------------|------|
| 1 | [Problemas Comuns](common-issues.md) | Problemas frequentemente encontrados | 30 min |
| 2 | [Guia de Debugging](debugging.md) | Estratégias de depuração passo a passo | 45 min |
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
| `ResourceNotFound` | Recurso em falta | Verificar nomes dos recursos |
| `QuotaExceeded` | Limites da subscrição | Solicitar aumento da cota |
| `InvalidTemplate` | Erro de sintaxe Bicep | `az bicep build` |
| `Conflict` | Recurso já existe | Usar nome novo ou apagar |
| `Forbidden` | Permissões insuficientes | Verificar funções RBAC |

---

## 🔄 Reposição e Recuperação

```bash
# Reinicialização suave (manter recursos, redesplegar código)
azd deploy --force

# Reinicialização completa (apagar tudo, começar do zero)
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