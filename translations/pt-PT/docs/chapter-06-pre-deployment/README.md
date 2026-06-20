# Capítulo 6: Planeamento & Validação Pré-Desdobramento

**📚 Curso**: [AZD Para Iniciantes](../../README.md) | **⏱️ Duração**: 1 hora | **⭐ Complexidade**: Intermédio

---

## Visão Geral

Este capítulo cobre passos essenciais de planeamento e validação antes de desdobrar a sua aplicação. Aprenda a evitar erros dispendiosos com o planeamento correto de capacidade, seleção de SKU e verificações prévias.

> Validado contra `azd 1.25.6` em junho de 2026.

## Objetivos de Aprendizagem

Ao completar este capítulo, irá:
- Executar verificações prévias antes do desdobramento
- Planear a capacidade e estimar os requisitos de recursos
- Selecionar SKUs apropriados para otimização de custos
- Configurar o Application Insights para monitorização
- Compreender padrões de coordenação de equipa

---

## 📚 Lições

| # | Lição | Descrição | Tempo |
|---|--------|-------------|------|
| 1 | [Verificações Prévias](preflight-checks.md) | Validar a configuração antes do desdobramento | 15 min |
| 2 | [Planeamento de Capacidade](capacity-planning.md) | Estimar os requisitos de recursos | 20 min |
| 3 | [Seleção de SKU](sku-selection.md) | Escolher os níveis de preço apropriados | 15 min |
| 4 | [Application Insights](application-insights.md) | Configurar monitorização | 20 min |
| 5 | [Padrões de Coordenação](coordination-patterns.md) | Fluxos de trabalho de desdobramento em equipa | 15 min |

---

## 🚀 Início Rápido

```bash
# Verificar cotas da subscrição
az vm list-usage --location eastus --output table

# Pré-visualizar implementação (sem criação de recursos)
azd provision --preview

# Validar sintaxe Bicep
az bicep build --file infra/main.bicep

# Verificar configuração do ambiente
azd env get-values
```

---

## ☑️ Lista de Verificação Pré-Desdobramento

### Antes do `azd provision`

- [ ] Quota verificada para a região
- [ ] SKUs selecionados de forma adequada
- [ ] Estimativa de custos revista
- [ ] Convenção de nomenclatura consistente
- [ ] Segurança/RBAC configurados

### Antes do `azd deploy`

- [ ] Variáveis de ambiente definidas
- [ ] Segredos no Key Vault
- [ ] Cadeias de ligação verificadas
- [ ] Verificações de integridade configuradas

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
| **Próximo** | [Capítulo 7: Resolução de Problemas](../chapter-07-troubleshooting/README.md) |

---

## 📖 Recursos Relacionados

- [Guia de Configuração](../chapter-03-configuration/configuration.md)
- [Guia de Desdobramento](../chapter-04-infrastructure/deployment-guide.md)
- [Problemas Comuns](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->