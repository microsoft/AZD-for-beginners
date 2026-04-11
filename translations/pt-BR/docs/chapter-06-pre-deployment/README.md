# Capítulo 6: Planejamento e Validação Pré-Implantação

**📚 Curso**: [AZD For Beginners](../../README.md) | **⏱️ Duração**: 1 hora | **⭐ Complexidade**: Intermediário

---

## Visão Geral

Este capítulo aborda etapas essenciais de planejamento e validação antes de implantar sua aplicação. Aprenda a evitar erros custosos com planejamento de capacidade adequado, seleção de SKUs e verificações pré-implantação.

> Validado contra `azd 1.23.12` em março de 2026.

## Objetivos de Aprendizagem

Ao concluir este capítulo, você irá:
- Executar verificações pré-implantação
- Planejar capacidade e estimar requisitos de recursos
- Selecionar SKUs apropriados para otimização de custos
- Configurar o Application Insights para monitoramento
- Entender padrões de coordenação da equipe

---

## 📚 Lições

| # | Lição | Descrição | Tempo |
|---|--------|-------------|------|
| 1 | [Verificações pré-implantação](preflight-checks.md) | Validar configuração antes da implantação | 15 min |
| 2 | [Planejamento de Capacidade](capacity-planning.md) | Estimar requisitos de recursos | 20 min |
| 3 | [Seleção de SKU](sku-selection.md) | Escolher níveis de preço apropriados | 15 min |
| 4 | [Application Insights](application-insights.md) | Configurar monitoramento | 20 min |
| 5 | [Padrões de Coordenação](coordination-patterns.md) | Fluxos de trabalho de implantação da equipe | 15 min |

---

## 🚀 Início Rápido

```bash
# Verificar cotas da assinatura
az vm list-usage --location eastus --output table

# Pré-visualizar implantação (nenhum recurso será criado)
azd provision --preview

# Validar sintaxe do Bicep
az bicep build --file infra/main.bicep

# Verificar configuração do ambiente
azd env get-values
```

---

## ☑️ Checklist de Pré-Implantação

### Antes de `azd provision`

- [ ] Cota verificada para a região
- [ ] SKUs selecionados adequadamente
- [ ] Estimativa de custo revisada
- [ ] Convenção de nomes consistente
- [ ] Segurança/RBAC configurados

### Antes de `azd deploy`

- [ ] Variáveis de ambiente definidas
- [ ] Segredos no Key Vault
- [ ] Strings de conexão verificadas
- [ ] Verificações de integridade configuradas

---

## 💰 Guia de Seleção de SKUs

| Workload | Development | Production |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navegação

| Direction | Chapter |
|-----------|---------|
| **Previous** | [Chapter 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Next** | [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/README.md) |

---

## 📖 Recursos Relacionados

- [Guia de Configuração](../chapter-03-configuration/configuration.md)
- [Guia de Implantação](../chapter-04-infrastructure/deployment-guide.md)
- [Problemas Comuns](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Isenção de responsabilidade**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se tradução profissional realizada por um tradutor humano. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->