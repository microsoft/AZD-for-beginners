# Capítulo 6: Planeamento e Validação Pré-Implementação

**📚 Curso**: [AZD Para Iniciantes](../../README.md) | **⏱️ Duração**: 1 hora | **⭐ Complexidade**: Intermédio

---

## Visão geral

Este capítulo cobre os passos essenciais de planeamento e validação antes de implantar a sua aplicação. Aprenda a evitar erros dispendiosos com um planeamento adequado da capacidade, seleção de SKUs e verificações prévias.

## Objetivos de Aprendizagem

Ao completar este capítulo, irá:
- Executar verificações pré-implementação antes de implantar
- Planear capacidade e estimar requisitos de recursos
- Selecionar SKUs apropriados para otimização de custos
- Configurar o Application Insights para monitorização
- Compreender padrões de coordenação da equipa

---

## 📚 Lições

| # | Lição | Descrição | Tempo |
|---|--------|-------------|------|
| 1 | [Verificações Pré-Implementação](preflight-checks.md) | Validar a configuração antes da implementação | 15 min |
| 2 | [Planeamento de Capacidade](capacity-planning.md) | Estimar requisitos de recursos | 20 min |
| 3 | [Seleção de SKU](sku-selection.md) | Escolher níveis de preço apropriados | 15 min |
| 4 | [Application Insights](application-insights.md) | Configurar monitorização | 20 min |
| 5 | [Padrões de Coordenação](coordination-patterns.md) | Fluxos de trabalho de implementação da equipa | 15 min |

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

## ☑️ Lista de Verificação Pré-Implementação

### Before `azd provision`

- [ ] Cota verificada para a região
- [ ] SKUs selecionados adequadamente
- [ ] Estimativa de custos revista
- [ ] Convenção de nomenclatura consistente
- [ ] Segurança/RBAC configurados

### Before `azd deploy`

- [ ] Variáveis de ambiente definidas
- [ ] Segredos no Key Vault
- [ ] Connection strings verificadas
- [ ] Verificações de integridade configuradas

---

## 💰 Guia de Seleção de SKUs

| Workload | Development | Production |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Azure OpenAI | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navegação

| Direction | Chapter |
|-----------|---------|
| **Previous** | [Capítulo 5: Multi-Agente](../chapter-05-multi-agent/README.md) |
| **Next** | [Capítulo 7: Resolução de Problemas](../chapter-07-troubleshooting/README.md) |

---

## 📖 Recursos Relacionados

- [Guia de Configuração](../chapter-03-configuration/configuration.md)
- [Guia de Implementação](../chapter-04-infrastructure/deployment-guide.md)
- [Problemas Comuns](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Isenção de responsabilidade**:
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos por alcançar precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se uma tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->