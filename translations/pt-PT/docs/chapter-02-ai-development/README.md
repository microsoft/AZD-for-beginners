# Capítulo 2: Desenvolvimento AI-First

**📚 Curso**: [AZD Para Iniciantes](../../README.md) | **⏱️ Duração**: 4-5 horas, incluindo o workshop | **⭐ Complexidade**: Intermédio

---

## Visão Geral

Este capítulo foca-se na implementação de aplicações alimentadas por IA usando a Azure Developer CLI e os serviços Microsoft Foundry. Desde aplicações simples de chat com IA a agentes inteligentes com ferramentas.

> **Atualização Foundry GA (2026-11-09):** O pacote `microsoft.foundry` 1.0 está [disponível globalmente](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Use `azd >= 1.37.0`; as avaliações permanecem uma instalação separada. O [tutorial do agente hospedado](microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) cobre testes locais do Agent Inspector e implementação remota do código. Isto é uma revisão da documentação, não uma validação de implementação ao vivo; as funcionalidades opcionais em pré-visualização mantêm o seu próprio estado.

## Objetivos de Aprendizagem

Ao completar este capítulo, irá:
- Implementar aplicações de IA usando templates AZD pré-construídos
- Compreender a integração Microsoft Foundry com AZD
- Instalar o pacote GA e testar localmente um agente hospedado antes de enviar o código para o Foundry
- Rever `azure.yaml`, os ativos de avaliação, e a limpeza de projetos novos versus reutilizados
- Configurar e personalizar agentes de IA com ferramentas
- Implementar aplicações RAG (Geração com Recuperação)

---

## 📚 Lições

| Nº | Lição | Descrição | Tempo |
|---|--------|-------------|------|
| 1 | [Integração Microsoft Foundry](microsoft-foundry-integration.md) | Pacote GA, fluxo de trabalho local para cloud com agente hospedado, e avaliações | 60 min |
| 2 | [Guia de Agentes de IA](agents.md) | Implementar agentes inteligentes com ferramentas | 45 min |
| 3 | [Implementação de Modelos IA](ai-model-deployment.md) | Implementar e configurar modelos de IA | 30 min |
| 4 | [Workshop de IA](ai-workshop-lab.md) | Prático: Explorar um template e planear a conversão | 2-3 horas |

---

## 🚀 Início Rápido

Escolha uma opção numa nova diretoria vazia. O `.` final inicializa a diretoria atual; caso contrário, AZD pode criar uma subdiretoria sem alterar o diretório de trabalho do seu shell.

Para o **caminho GA de implementação de código do agente hospedado**, comece com o [tutorial guiado](microsoft-foundry-integration.md#hosted-agent-walkthrough-ga). É necessário AZD 1.37.0+, current uv, Python 3.13+, permissões no Foundry, e quota de modelos. Os templates completos de aplicação abaixo são alternativas, não pré-requisitos para esse tutorial.

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

## 🤖 Templates de IA em Destaque

| Template | Descrição | Serviços |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Chat RAG com citações | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Agente de IA com ferramentas | Serviço de Agentes de IA |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chat básico com IA | OpenAI + Container Apps |

---

## 💰 Consciência de Custos

Estes são intervalos ilustrativos, não orçamentos ou limites; o tráfego do modelo, SKUs de busca/cálculo, região, e funcionalidades opcionais podem ultrapassá-los. Reveja as orientações de preços atuais do exemplo escolhido antes da provisão.

| Ambiente | Custo Mensal Estimado |
|-------------|----------------------|
| Desenvolvimento | 80-150 $ |
| Staging | 150-300 $ |
| Produção | 300-3.500+ $ |

**Limpeza:** Reveja `azd down` antes de confirmar: para um projeto Foundry recém-criado elimina o grupo de recursos e tudo nele. Para um projeto Foundry reutilizado, mantém o projeto e os recursos do agente no lugar; siga as [orientações de limpeza do tutorial](microsoft-foundry-integration.md#7-clean-up-deliberately) para remover recursos indesejados separadamente.

---

## 🔗 Navegação

| Direção | Capítulo |
|-----------|---------|
| **Anterior** | [Capítulo 1: Fundamentos](../chapter-01-foundation/README.md) |
| **Seguinte** | [Capítulo 3: Configuração](../chapter-03-configuration/README.md) |
| **Ir para** | [Capítulo 8: Padrões de Produção](../chapter-08-production/README.md) |

---

## 📖 Recursos Relacionados

- [Resolução de Problemas de IA](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Práticas de IA em Produção](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->