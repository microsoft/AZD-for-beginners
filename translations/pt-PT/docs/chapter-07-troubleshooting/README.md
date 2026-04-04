# Capítulo 7: Resolução de Problemas e Depuração

**📚 Curso**: [AZD Para Iniciantes](../../README.md) | **⏱️ Duração**: 1-1.5 horas | **⭐ Complexidade**: Intermédio

---

## Visão Geral

Este capítulo ajuda a diagnosticar e resolver problemas comuns ao trabalhar com Azure Developer CLI. Desde falhas de implementação a problemas específicos de IA.

> Validado com `azd 1.23.12` em março de 2026.

## Objetivos de Aprendizagem

Ao completar este capítulo, irá:
- Diagnosticar falhas comuns em implementações AZD
- Depurar problemas de autenticação e permissões
- Resolver problemas de conectividade dos serviços de IA
- Utilizar o Azure Portal e a CLI para resolução de problemas

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
| `ResourceNotFound` | Recurso em falta | Verificar nomes dos recursos |
| `QuotaExceeded` | Limites da subscrição | Solicitar aumento da quota |
| `InvalidTemplate` | Erro de sintaxe Bicep | `az bicep build` |
| `Conflict` | Recurso existe | Usar novo nome ou eliminar |
| `Forbidden` | Permissões insuficientes | Verificar funções RBAC |

---

## 🔄 Reposição e Recuperação

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
| **Anterior** | [Capítulo 6: Pré-Implementação](../chapter-06-pre-deployment/README.md) |
| **Seguinte** | [Capítulo 8: Produção](../chapter-08-production/README.md) |

---

## 📖 Recursos Relacionados

- [Verificações Pré-Implementação](../chapter-06-pre-deployment/preflight-checks.md)
- [Guia de Configuração](../chapter-03-configuration/configuration.md)
- [Problemas AZD no GitHub](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Apesar de nos esforçarmos pela precisão, por favor tenha em conta que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado como a fonte autoritativa. Para informação crítica, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações erradas decorrentes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->