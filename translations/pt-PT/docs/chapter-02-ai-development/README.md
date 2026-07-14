# Capítulo 2: Desenvolvimento AI-First

**📚 Curso**: [AZD Para Iniciantes](../../README.md) | **⏱️ Duração**: 1-2 horas | **⭐ Complexidade**: Intermédio

---

## Visão Geral

Este capítulo foca-se na implementação de aplicações alimentadas por IA utilizando o Azure Developer CLI e os serviços Microsoft Foundry. Desde aplicações de chat simples com IA a agentes inteligentes com ferramentas.

> **Nota de validação (2026-07-13):** O fluxo de comandos e as orientações das extensões neste capítulo foram revistos com base na versão `azd` `1.27.1` e a atual versão de pré-visualização da extensão de agentes IA `azure.ai.agents` `1.0.0-beta.5`. Se estiver numa versão mais antiga do AZD, atualize primeiro e depois continue com os exercícios.

## Objetivos de Aprendizagem

Ao concluir este capítulo, irá:
- Implementar aplicações de IA utilizando templates pré-construídos AZD
- Compreender a integração Microsoft Foundry com AZD
- Configurar e personalizar agentes IA com ferramentas
- Implementar aplicações RAG (Geração Aumentada por Recuperação)

---

## 📚 Aulas

| # | Aula | Descrição | Duração |
|---|--------|-----------|---------|
| 1 | [Integração Microsoft Foundry](microsoft-foundry-integration.md) | Ligar AZD aos serviços Foundry | 30 min |
| 2 | [Guia de Agentes IA](agents.md) | Implementar agentes inteligentes com ferramentas | 45 min |
| 3 | [Implementação de Modelo IA](ai-model-deployment.md) | Implementar e configurar modelos IA | 30 min |
| 4 | [Laboratório Workshop IA](ai-workshop-lab.md) | Prático: Prepare a sua solução IA para AZD | 60 min |

---

## 🚀 Início Rápido

```bash
# Opção 1: Aplicação de Chat RAG
azd init --template azure-search-openai-demo
azd up

# Opção 2: Agentes de IA
azd init --template get-started-with-ai-agents
azd up

# Opção 3: Aplicação de Chat Rápido
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Templates IA em Destaque

| Template | Descrição | Serviços |
|----------|-----------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Chat RAG com citações | OpenAI + Pesquisa IA |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Agente IA com ferramentas | Serviço de Agentes IA |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chat básico IA | OpenAI + Container Apps |

---

## 💰 Consciência de Custos

| Ambiente | Custo Mensal Estimado |
|-----------|----------------------|
| Desenvolvimento | 80-150 $ |
| Staging | 150-300 $ |
| Produção | 300-3.500+ $ |

**Dica:** Execute `azd down` após os testes para evitar custos.

---

## 🔗 Navegação

| Direção | Capítulo |
|---------|---------|
| **Anterior** | [Capítulo 1: Fundamentos](../chapter-01-foundation/README.md) |
| **Seguinte** | [Capítulo 3: Configuração](../chapter-03-configuration/README.md) |
| **Saltar para** | [Capítulo 8: Padrões de Produção](../chapter-08-production/README.md) |

---

## 📖 Recursos Relacionados

- [Resolução de Problemas IA](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Práticas IA em Produção](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->