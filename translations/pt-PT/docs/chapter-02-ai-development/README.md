# Capítulo 2: Desenvolvimento AI-First

**📚 Curso**: [AZD Para Iniciantes](../../README.md) | **⏱️ Duração**: 4-5 horas incluindo o workshop | **⭐ Complexidade**: Intermédio

---

## Visão Geral

Este capítulo foca-se na implementação de aplicações com inteligência artificial utilizando o Azure Developer CLI e os serviços Microsoft Foundry. Desde simples aplicações de chat IA a agentes inteligentes com ferramentas.

> **Revisão da versão (2026-11-04):** A orientação AI CLI foi verificada contra a documentação/fonte publicada `azd` `1.37.2`, `azure.ai.agents` `1.0.0-beta.23`, e `azure.ai.evaluations` `1.0.0-beta.2`. Use `azd >= 1.37.0` para o fluxo de trabalho combinado. As avaliações usam agora o namespace separado `azd ai eval`; veja [alterações da versão e orientação de migração](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes). Esta não é uma validação de implementação ao vivo.

## Objetivos de Aprendizagem

Ao completar este capítulo, irá:
- Implementar aplicações de IA utilizando templates AZD pré-construídos
- Compreender a integração Microsoft Foundry com AZD
- Configurar e personalizar agentes de IA com ferramentas
- Implementar aplicações RAG (Geração Aumentada por Recuperação)

---

## 📚 Lições

| # | Lição | Descrição | Tempo |
|---|--------|-------------|------|
| 1 | [Integração Microsoft Foundry](microsoft-foundry-integration.md) | Ligar AZD aos serviços Foundry | 30 min |
| 2 | [Guia Agentes AI](agents.md) | Implementar agentes inteligentes com ferramentas | 45 min |
| 3 | [Implementação de Modelos AI](ai-model-deployment.md) | Implementar e configurar modelos AI | 30 min |
| 4 | [Laboratório Workshop AI](ai-workshop-lab.md) | Prático: Explore um template e planeie a sua conversão | 2-3 horas |

---

## 🚀 Início Rápido

Escolha uma opção numa nova diretoria vazia. O `.` final inicializa a diretoria atual; caso contrário, AZD pode criar uma subdiretoria sem alterar o diretório de trabalho do seu shell.

```bash
# Option 1: RAG Chat Application
azd init --template azure-search-openai-demo .
azd up

# Option 2: AI Agents
azd init --template get-started-with-ai-agents .
azd up

# Option 3: Quick Chat App
azd init --template openai-chat-app-quickstart .
azd up
```

---

## 🤖 Templates AI em Destaque

| Template | Descrição | Serviços |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Chat RAG com citações | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Agente AI com ferramentas | Serviço Agente AI |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chat básico AI | OpenAI + Container Apps |

---

## 💰 Consciência de Custos

Estes são intervalos ilustrativos, não cotações ou limites; o tráfego do modelo, SKUs de pesquisa/cálculo, região e funcionalidades opcionais podem excedê-los. Reveja a orientação de preços atual da amostra escolhida antes de provisionar.

| Ambiente | Custo Mensal Estimado |
|-------------|----------------------|
| Desenvolvimento | 80-150 $ |
| Pré-produção | 150-300 $ |
| Produção | 300-3,500+ $ |

**Dica:** Execute `azd down` após o teste para evitar cobranças.

---

## 🔗 Navegação

| Direção | Capítulo |
|-----------|---------|
| **Anterior** | [Capítulo 1: Fundamentos](../chapter-01-foundation/README.md) |
| **Seguinte** | [Capítulo 3: Configuração](../chapter-03-configuration/README.md) |
| **Ir para** | [Capítulo 8: Padrões de Produção](../chapter-08-production/README.md) |

---

## 📖 Recursos Relacionados

- [Resolução de Problemas AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Práticas AI em Produção](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->