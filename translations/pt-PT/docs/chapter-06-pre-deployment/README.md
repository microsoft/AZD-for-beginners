# Capítulo 6: Planeamento e Validação Pré-Implantação

**📚 Curso**: [AZD Para Iniciantes](../../README.md) | **⏱️ Duração**: 1 hora | **⭐ Complexidade**: Intermédio

---

## Visão Geral

Este capítulo aborda os passos essenciais de planeamento e validação antes de implantar a sua aplicação. Aprenda a evitar erros dispendiosos com um planeamento adequado da capacidade, seleção de SKU e verificações prévias.

> Validado com `azd 1.23.12` em março de 2026.

## Objetivos de Aprendizagem

Ao completar este capítulo, irá:
- Executar verificações prévias antes da implantação
- Planear a capacidade e estimar os requisitos de recursos
- Selecionar SKUs adequados para otimização de custos
- Configurar o Application Insights para monitorização
- Compreender os padrões de coordenação de equipa

---

## 📚 Lições

| # | Lição | Descrição | Tempo |
|---|--------|-------------|------|
| 1 | [Verificações Prévias](preflight-checks.md) | Validar configuração antes da implantação | 15 min |
| 2 | [Planeamento de Capacidade](capacity-planning.md) | Estimar requisitos de recursos | 20 min |
| 3 | [Seleção de SKU](sku-selection.md) | Escolher níveis de preço adequados | 15 min |
| 4 | [Application Insights](application-insights.md) | Configurar monitorização | 20 min |
| 5 | [Padrões de Coordenação](coordination-patterns.md) | Fluxos de trabalho de implantação de equipa | 15 min |

---

## 🚀 Início Rápido

```bash
# Verificar quotas da subscrição
az vm list-usage --location eastus --output table

# Pré-visualizar implantação (nenhum recurso criado)
azd provision --preview

# Validar sintaxe do Bicep
az bicep build --file infra/main.bicep

# Verificar configuração do ambiente
azd env get-values
```

---

## ☑️ Lista de Verificação Pré-Implantação

### Antes de `azd provision`

- [ ] Quota verificada para a região
- [ ] SKUs selecionados adequadamente
- [ ] Estimativa de custos revista
- [ ] Convenção de nomenclatura consistente
- [ ] Segurança/RBAC configurados

### Antes de `azd deploy`

- [ ] Variáveis de ambiente definidas
- [ ] Segredos no Key Vault
- [ ] Strings de ligação verificadas
- [ ] Verificações de estado configuradas

---

## 💰 Guia de Seleção de SKU

| Carga de Trabalho | Desenvolvimento | Produção |
|----------|-------------|------------|
| Container Apps | Consumo | Dedicado D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Básico | Standard S2+ |

---

## 🔗 Navegação

| Direção | Capítulo |
|-----------|---------|
| **Anterior** | [Capítulo 5: Multi-Agente](../chapter-05-multi-agent/README.md) |
| **Seguinte** | [Capítulo 7: Resolução de Problemas](../chapter-07-troubleshooting/README.md) |

---

## 📖 Recursos Relacionados

- [Guia de Configuração](../chapter-03-configuration/configuration.md)
- [Guia de Implantação](../chapter-04-infrastructure/deployment-guide.md)
- [Problemas Comuns](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos empenhemos em garantir a precisão, por favor tenha em conta que as traduções automáticas podem conter erros ou imprecisões. O documento original, na sua língua nativa, deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações erradas decorrentes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->