# Capítulo 7: Solução de Problemas e Depuração

**📚 Curso**: [AZD para Iniciantes](../../README.md) | **⏱️ Duração**: 1-1.5 horas | **⭐ Complexidade**: Intermediário

---

## Visão geral

Este capítulo ajuda você a diagnosticar e resolver problemas comuns ao trabalhar com o Azure Developer CLI. Desde falhas de implantação até problemas específicos de IA.

> Validado com `azd 1.25.6` em junho de 2026.

## Objetivos de aprendizagem

Ao concluir este capítulo, você irá:
- Diagnosticar falhas comuns de implantação do AZD
- Depurar problemas de autenticação e permissões
- Resolver problemas de conectividade de serviços de IA
- Usar o Portal do Azure e a CLI para solução de problemas

---

## 📚 Lições

| # | Lição | Descrição | Tempo |
|---|--------|-------------|------|
| 1 | [Problemas Comuns](common-issues.md) | Problemas frequentemente encontrados | 30 min |
| 2 | [Guia de Depuração](debugging.md) | Estratégias de depuração passo a passo | 45 min |
| 3 | [Solução de Problemas de IA](ai-troubleshooting.md) | Problemas específicos de IA | 30 min |

---

## 🚨 Correções Rápidas

### Problemas de Autenticação
```bash
# Obrigatório para fluxos de trabalho do AZD
azd auth login

# Opcional se você também estiver usando comandos do Azure CLI diretamente
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
| `ResourceNotFound` | Recurso ausente | Verificar nomes dos recursos |
| `QuotaExceeded` | Limites da assinatura | Solicitar aumento de cota |
| `InvalidTemplate` | Erro de sintaxe do Bicep | `az bicep build` |
| `Conflict` | Recurso existe | Usar novo nome ou excluir |
| `Forbidden` | Permissões insuficientes | Verificar funções RBAC |

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