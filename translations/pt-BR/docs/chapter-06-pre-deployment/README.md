# Capítulo 6: Planejamento e Validação Pré-Implantação

**📚 Curso**: [AZD Para Iniciantes](../../README.md) | **⏱️ Duração**: 2-4 horas de leitura; tempo adicional para laboratórios adaptados | **⭐ Complexidade**: Intermediário–Avançado

---

## Visão Geral

Este capítulo cobre etapas essenciais de planejamento e validação antes de implantar sua aplicação. Aprenda a evitar erros custosos com planejamento adequado de capacidade, seleção de SKU e verificações prévias.

> Orientação de comandos revisada com base na referência `azd 1.37.2` lançada. Implantações na nuvem não foram executadas. As lições mais longas incluem fragmentos ilustrativos, não projetos completos de implantação local.

## Objetivos de Aprendizagem

Ao concluir este capítulo, você irá:
- Executar verificações prévias antes da implantação
- Planejar capacidade e estimar requisitos de recursos
- Selecionar SKUs apropriados para otimização de custo
- Configurar Application Insights para monitoramento
- Compreender padrões de coordenação multiagente e seus requisitos de implantação

---

## 📚 Lições

| # | Lição | Descrição | Tempo |
|---|--------|-------------|------|
| 1 | [Verificações Prévias](preflight-checks.md) | Validar configuração antes da implantação | 15 min |
| 2 | [Planejamento de Capacidade](capacity-planning.md) | Estimar requisitos de recursos | 20 min |
| 3 | [Seleção de SKU](sku-selection.md) | Escolher níveis de preço apropriados | 15 min |
| 4 | [Application Insights](application-insights.md) | Configurar monitoramento | 20 min |
| 5 | [Padrões de Coordenação](coordination-patterns.md) | Design avançado de orquestração multiagente | 60-75 min |

---

## 🚀 Começo Rápido

```bash
# Check subscription quotas
az vm list-usage --location eastus --output table

# Preview infrastructure changes (inspect template hooks before running)
azd provision --preview

# Validate Bicep syntax
az bicep build --file infra/main.bicep

# Check environment configuration
azd env get-values
```

---

## ☑️ Lista de Verificação Pré-Implantação

### Antes do `azd provision`

- [ ] Cota verificada para a região
- [ ] SKUs selecionados apropriadamente
- [ ] Estimativa de custo revisada
- [ ] Convenção de nomenclatura consistente
- [ ] Segurança/RBAC configurados

### Antes do `azd deploy`

- [ ] Variáveis de ambiente definidas
- [ ] Segredos no Key Vault
- [ ] Cadeias de conexão verificadas
- [ ] Verificações de integridade configuradas

---

## 💰 Guia de Seleção de SKU

| Carga de Trabalho | Desenvolvimento | Produção |
|----------|-------------|------------|
| Container Apps | Consumo | Consumo ou perfil dedicado, baseado na carga medida |
| App Service | B1/B2 | P1v3+ |
| Modelos Azure OpenAI | Tipo de implantação pay-as-you-go suportada | Pay-as-you-go ou throughput provisionado; depende do modelo/região |
| AI Search | Gratuito/Básico dentro dos limites | Nível Básico ou Standard dimensionado para índice, réplicas e carga de consulta |

---

## 🔗 Navegação

| Direção | Capítulo |
|-----------|---------|
| **Anterior** | [Capítulo 5: Multiagente](../chapter-05-multi-agent/README.md) |
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