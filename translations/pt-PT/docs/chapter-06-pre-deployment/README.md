# Capítulo 6: Planeamento e Validação Pré-Implementação

**📚 Curso**: [AZD Para Iniciantes](../../README.md) | **⏱️ Duração**: 2-4 horas de leitura; tempo adicional para laboratórios adaptados | **⭐ Complexidade**: Intermédio–Avançado

---

## Visão Geral

Este capítulo cobre passos essenciais de planeamento e validação antes de implementar a sua aplicação. Aprenda a evitar erros dispendiosos com planeamento adequado de capacidade, seleção de SKU e verificações prévias.

> Orientação de comandos revista em relação à referência `azd 1.37.2` publicada. Não foram executadas implementações na cloud. As lições mais longas incluem fragmentos ilustrativos, não projetos completos de implementação local.

## Objetivos de Aprendizagem

Ao completar este capítulo, você irá:
- Executar verificações prévias antes da implementação
- Planear a capacidade e estimar os requisitos de recursos
- Selecionar SKUs apropriados para otimização de custos
- Configurar Application Insights para monitorização
- Compreender padrões de coordenação multi-agente e os seus requisitos de implementação

---

## 📚 Lições

| # | Lição | Descrição | Duração |
|---|--------|-------------|------|
| 1 | [Verificações Prévias](preflight-checks.md) | Validar configuração antes da implementação | 15 min |
| 2 | [Planeamento de Capacidade](capacity-planning.md) | Estimar requisitos de recursos | 20 min |
| 3 | [Seleção de SKU](sku-selection.md) | Escolher níveis de preço adequados | 15 min |
| 4 | [Application Insights](application-insights.md) | Configurar monitorização | 20 min |
| 5 | [Padrões de Coordenação](coordination-patterns.md) | Design avançado de orquestração multi-agente | 60-75 min |

---

## 🚀 Início Rápido

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

## ☑️ Lista de Verificação Pré-Implementação

### Antes de `azd provision`

- [ ] Quota verificada para a região
- [ ] SKUs selecionados apropriadamente
- [ ] Estimativa de custos revista
- [ ] Convenção de nomenclatura consistente
- [ ] Segurança/RBAC configurados

### Antes de `azd deploy`

- [ ] Variáveis de ambiente definidas
- [ ] Segredos no Key Vault
- [ ] Cadeias de conexão verificadas
- [ ] Verificações de integridade configuradas

---

## 💰 Guia de Seleção de SKU

| Carga de trabalho | Desenvolvimento | Produção |
|----------|-------------|------------|
| Container Apps | Consumo | Consumo ou perfil de carga dedicado, baseado na carga medida |
| App Service | B1/B2 | P1v3+ |
| Modelos Azure OpenAI | Tipo de implementação pay-as-you-go suportado | Pay-as-you-go ou throughput provisionado; depende do modelo/região |
| AI Search | Gratuito/Básico dentro dos limites | Nível Básico ou Standard dimensionado para índice, réplicas e carga de consulta |

---

## 🔗 Navegação

| Direção | Capítulo |
|-----------|---------|
| **Anterior** | [Capítulo 5: Multi-Agente](../chapter-05-multi-agent/README.md) |
| **Seguinte** | [Capítulo 7: Resolução de Problemas](../chapter-07-troubleshooting/README.md) |

---

## 📖 Recursos Relacionados

- [Guia de Configuração](../chapter-03-configuration/configuration.md)
- [Guia de Implementação](../chapter-04-infrastructure/deployment-guide.md)
- [Problemas Comuns](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->