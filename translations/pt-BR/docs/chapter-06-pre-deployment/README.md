# Capítulo 6: Planejamento & Validação Pré-Implantação

**📚 Curso**: [AZD Para Iniciantes](../../README.md) | **⏱️ Duração**: 1 hora | **⭐ Complexidade**: Intermediário

---

## Visão Geral

Este capítulo cobre etapas essenciais de planejamento e validação antes de implantar sua aplicação. Aprenda a evitar erros custosos com planejamento adequado de capacidade, seleção de SKU e verificações prévias.

> Validado contra `azd 1.27.1` em julho de 2026.

## Objetivos de Aprendizagem

Ao concluir este capítulo, você irá:
- Executar verificações prévias antes da implantação
- Planejar capacidade e estimar requisitos de recursos
- Selecionar SKUs apropriados para otimização de custos
- Configurar Application Insights para monitoramento
- Entender padrões de coordenação de equipe

---

## 📚 Lições

| # | Lição | Descrição | Duração |
|---|--------|-------------|---------|
| 1 | [Verificações Prévias](preflight-checks.md) | Validar configuração antes da implantação | 15 min |
| 2 | [Planejamento de Capacidade](capacity-planning.md) | Estimar requisitos de recursos | 20 min |
| 3 | [Seleção de SKU](sku-selection.md) | Escolher faixas de preço adequadas | 15 min |
| 4 | [Application Insights](application-insights.md) | Configurar monitoramento | 20 min |
| 5 | [Padrões de Coordenação](coordination-patterns.md) | Fluxos de trabalho de equipe na implantação | 15 min |

---

## 🚀 Início Rápido

```bash
# Verificar cotas da assinatura
az vm list-usage --location eastus --output table

# Visualizar implantação (nenhum recurso criado)
azd provision --preview

# Validar sintaxe Bicep
az bicep build --file infra/main.bicep

# Verificar configuração do ambiente
azd env get-values
```

---

## ☑️ Lista de Verificação Pré-Implantação

### Antes do `azd provision`

- [ ] Cotas verificadas para a região
- [ ] SKUs selecionados apropriadamente
- [ ] Estimativa de custo revisada
- [ ] Convenção de nomenclatura consistente
- [ ] Segurança/RBAC configurada

### Antes do `azd deploy`

- [ ] Variáveis de ambiente definidas
- [ ] Segredos no Key Vault
- [ ] Strings de conexão verificadas
- [ ] Verificações de integridade configuradas

---

## 💰 Guia de Seleção de SKU

| Carga de Trabalho | Desenvolvimento | Produção |
|------------------|---------------|-----------|
| Container Apps | Consumo | Dedicado D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Padrão | Padrão + PTU |
| AI Search | Básico | Padrão S2+ |

---

## 🔗 Navegação

| Direção | Capítulo |
|---------|----------|
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
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->