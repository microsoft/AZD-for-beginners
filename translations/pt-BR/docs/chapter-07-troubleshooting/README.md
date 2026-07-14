# Capítulo 7: Solução de Problemas e Depuração

**📚 Curso**: [AZD Para Iniciantes](../../README.md) | **⏱️ Duração**: 1-1,5 horas | **⭐ Complexidade**: Intermediário

---

## Visão Geral

Este capítulo ajuda você a diagnosticar e resolver problemas comuns ao trabalhar com Azure Developer CLI. Desde falhas de implantação até problemas específicos de IA.

> Validado contra `azd 1.27.1` em julho de 2026.

## Objetivos de Aprendizagem

Ao concluir este capítulo, você irá:
- Diagnosticar falhas comuns de implantação do AZD
- Depurar problemas de autenticação e permissões
- Resolver problemas de conectividade de serviços de IA
- Usar o Azure Portal e CLI para solução de problemas

---

## 📚 Lições

| # | Aula | Descrição | Tempo |
|---|--------|-------------|------|
| 1 | [Problemas Comuns](common-issues.md) | Problemas frequentemente encontrados | 30 min |
| 2 | [Guia de Depuração](debugging.md) | Estratégias passo a passo para depuração | 45 min |
| 3 | [Solução de Problemas de IA](ai-troubleshooting.md) | Problemas específicos de IA | 30 min |

---

## 🚨 Correções Rápidas

### Problemas de Autenticação
```bash
# Necessário para fluxos de trabalho AZD
azd auth login

# Opcional se você também estiver usando comandos do Azure CLI diretamente
az login

azd auth status
```

### Falhas na Provisão
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

## 📋 Referência de Código de Erro

| Erro | Causa | Solução |
|-------|-------|----------|
| `AuthenticationError` | Não autenticado | `azd auth login` |
| `ResourceNotFound` | Recurso ausente | Verifique os nomes dos recursos |
| `QuotaExceeded` | Limites de assinatura | Solicite aumento de cota |
| `InvalidTemplate` | Erro de sintaxe no Bicep | `az bicep build` |
| `Conflict` | Recurso já existe | Use novo nome ou exclua |
| `Forbidden` | Permissões insuficientes | Verifique os papéis RBAC |

---

## 🔄 Reset e Recuperação

```bash
# Reinicialização suave (manter recursos, reimplantar código)
azd deploy --force

# Reinicialização forçada (excluir tudo, começar do zero)
azd down --force --purge
azd up
```

---

## 🔗 Navegação

| Direção | Capítulo |
|-----------|---------|
| **Anterior** | [Capítulo 6: Pré-implantação](../chapter-06-pre-deployment/README.md) |
| **Próximo** | [Capítulo 8: Produção](../chapter-08-production/README.md) |

---

## 📖 Recursos Relacionados

- [Verificações Pré-implantação](../chapter-06-pre-deployment/preflight-checks.md)
- [Guia de Configuração](../chapter-03-configuration/configuration.md)
- [Problemas no GitHub do AZD](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->