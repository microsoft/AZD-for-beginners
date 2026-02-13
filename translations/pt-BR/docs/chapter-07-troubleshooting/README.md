# Capítulo 7: Solução de Problemas & Depuração

**📚 Curso**: [AZD For Beginners](../../README.md) | **⏱️ Duração**: 1-1,5 horas | **⭐ Complexidade**: Intermediário

---

## Visão geral

Este capítulo ajuda você a diagnosticar e resolver problemas comuns ao trabalhar com o Azure Developer CLI. De falhas de implantação a problemas específicos de IA.

## Objetivos de Aprendizagem

Ao completar este capítulo, você irá:
- Diagnosticar falhas comuns de implantação do AZD
- Depurar problemas de autenticação e permissões
- Resolver problemas de conectividade de serviços de IA
- Usar o Azure Portal e CLI para solução de problemas

---

## 📚 Aulas

| # | Aula | Descrição | Tempo |
|---|--------|-------------|------|
| 1 | [Problemas Comuns](common-issues.md) | Problemas frequentemente encontrados | 30 min |
| 2 | [Guia de Depuração](debugging.md) | Estratégias passo a passo para depuração | 45 min |
| 3 | [Solução de Problemas de IA](ai-troubleshooting.md) | Problemas específicos de IA | 30 min |

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

| Error | Cause | Solution |
|-------|-------|----------|
| `AuthenticationError` | Não autenticado | `azd auth login` |
| `ResourceNotFound` | Recurso ausente | Verifique os nomes dos recursos |
| `QuotaExceeded` | Limites da assinatura | Solicitar aumento de cota |
| `InvalidTemplate` | Erro de sintaxe do Bicep | `az bicep build` |
| `Conflict` | Recurso existe | Use um novo nome ou exclua |
| `Forbidden` | Permissões insuficientes | Verifique funções RBAC |

---

## 🔄 Redefinição e Recuperação

```bash
# Reinicialização suave (manter recursos, reimplantar o código)
azd deploy --force

# Reinicialização completa (excluir tudo, começar do zero)
azd down --force --purge
azd up
```

---

## 🔗 Navegação

| Direction | Chapter |
|-----------|---------|
| **Previous** | [Capítulo 6: Pré-Implantação](../chapter-06-pre-deployment/README.md) |
| **Next** | [Capítulo 8: Produção](../chapter-08-production/README.md) |

---

## 📖 Recursos Relacionados

- [Verificações pré-implantação](../chapter-06-pre-deployment/preflight-checks.md)
- [Guia de Configuração](../chapter-03-configuration/configuration.md)
- [Issues do AZD no GitHub](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Isenção de responsabilidade**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional por um tradutor humano. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->