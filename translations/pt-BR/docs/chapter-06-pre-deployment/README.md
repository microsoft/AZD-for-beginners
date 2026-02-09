# Capítulo 6: Planejamento e Validação Pré-Implantação

**📚 Curso**: [AZD Para Iniciantes](../../README.md) | **⏱️ Duração**: 1 hora | **⭐ Complexidade**: Intermediário

---

## Visão Geral

Este capítulo aborda etapas essenciais de planejamento e validação antes de implantar sua aplicação. Aprenda a evitar erros custosos com planejamento de capacidade adequado, seleção de SKU e verificações preflight.

## Objetivos de Aprendizagem

Ao concluir este capítulo, você irá:
- Executar verificações preflight antes da implantação
- Planejar capacidade e estimar requisitos de recursos
- Selecionar SKUs apropriados para otimização de custos
- Configurar o Application Insights para monitoramento
- Entender padrões de coordenação da equipe

---

## 📚 Aulas

| # | Lição | Descrição | Tempo |
|---|--------|-------------|------|
| 1 | [Preflight Checks](preflight-checks.md) | Validar a configuração antes da implantação | 15 min |
| 2 | [Capacity Planning](capacity-planning.md) | Estimar requisitos de recursos | 20 min |
| 3 | [SKU Selection](sku-selection.md) | Escolher níveis de preço apropriados | 15 min |
| 4 | [Application Insights](application-insights.md) | Configurar monitoramento | 20 min |
| 5 | [Coordination Patterns](coordination-patterns.md) | Fluxos de trabalho de implantação em equipe | 15 min |

---

## 🚀 Início Rápido

```bash
# Verificar cotas da assinatura
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

### Before `azd provision`

- [ ] Cota verificada para a região
- [ ] SKUs selecionados adequadamente
- [ ] Estimativa de custos revisada
- [ ] Convenção de nomenclatura consistente
- [ ] Segurança/RBAC configurada

### Before `azd deploy`

- [ ] Variáveis de ambiente definidas
- [ ] Segredos no Key Vault
- [ ] Strings de conexão verificadas
- [ ] Verificações de integridade configuradas

---

## 💰 Guia de Seleção de SKU

| Workload | Development | Production |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Azure OpenAI | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navegação

| Direção | Capítulo |
|-----------|---------|
| **Anterior** | [Capítulo 5: Multi-Agente](../chapter-05-multi-agent/README.md) |
| **Próximo** | [Capítulo 7: Solução de Problemas](../chapter-07-troubleshooting/README.md) |

---

## 📖 Recursos Relacionados

- [Guia de Configuração](../chapter-03-configuration/configuration.md)
- [Guia de Implantação](../chapter-04-infrastructure/deployment-guide.md)
- [Problemas Comuns](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se uma tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->