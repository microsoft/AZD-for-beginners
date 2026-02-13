# Capítulo 8: Padrões de Produção e Empresariais

**📚 Curso**: [AZD For Beginners](../../README.md) | **⏱️ Duração**: 2-3 horas | **⭐ Complexidade**: Avançado

---

## Visão Geral

Este capítulo aborda padrões de implantação prontos para empresas, reforço de segurança, monitorização e otimização de custos para cargas de trabalho de IA em produção.

## Objetivos de Aprendizagem

Ao concluir este capítulo, você irá:
- Implementar aplicações resilientes multi-região
- Implementar padrões de segurança empresariais
- Configurar monitorização abrangente
- Otimizar custos à escala
- Configurar pipelines CI/CD com AZD

---

## 📚 Lessons

| # | Aula | Descrição | Tempo |
|---|--------|-------------|------|
| 1 | [Práticas de IA para Produção](production-ai-practices.md) | Padrões de implantação empresarial | 90 min |

---

## 🚀 Lista de Verificação de Produção

- [ ] Implementação multi-região para resiliência
- [ ] Identidade gerida para autenticação (sem chaves)
- [ ] Application Insights para monitorização
- [ ] Orçamentos de custos e alertas configurados
- [ ] Verificação de segurança ativada
- [ ] Integração da pipeline CI/CD
- [ ] Plano de recuperação de desastres

---

## 🏗️ Padrões de Arquitetura

### Padrão 1: Microserviços de IA

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   API Gateway   │───▶│   AI Service    │───▶│   Azure OpenAI  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                      │
         ▼                      ▼
┌─────────────────┐    ┌─────────────────┐
│   Auth Service  │    │   Data Store    │
└─────────────────┘    └─────────────────┘
```

### Padrão 2: IA Orientada a Eventos

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Event Grid    │───▶│  Functions      │───▶│   AI Pipeline   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

---

## 🔐 Melhores Práticas de Segurança

```bicep
// Use managed identity
identity: {
  type: 'SystemAssigned'
}

// Private endpoints for AI services
properties: {
  publicNetworkAccess: 'Disabled'
  networkAcls: {
    defaultAction: 'Deny'
  }
}
```

---

## 💰 Otimização de Custos

| Strategy | Savings |
|----------|---------|
| Scale to zero (Container Apps) | 60-80% |
| Use consumption tiers for dev | 50-70% |
| Scheduled scaling | 30-50% |
| Reserved capacity | 20-40% |

```bash
# Definir alertas de orçamento
az consumption budget create \
  --budget-name "AI-Budget" \
  --amount 500 \
  --category Cost \
  --time-grain Monthly
```

---

## 📊 Configuração de Monitorização

```bash
# Transmitir registos
azd monitor --logs

# Verificar o Application Insights
azd monitor

# Ver métricas
az monitor metrics list --resource <resource-id>
```

---

## 🔗 Navegação

| Direction | Chapter |
|-----------|---------|
| **Anterior** | [Capítulo 7: Resolução de Problemas](../chapter-07-troubleshooting/README.md) |
| **Curso Concluído** | [Início do Curso](../../README.md) |

---

## 📖 Recursos Relacionados

- [Guia de Agentes de IA](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [Soluções Multi-Agente](../chapter-05-multi-agent/README.md)
- [Exemplo de Microserviços](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Isenção de responsabilidade**:
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos por garantir a precisão, tenha em atenção que traduções automáticas podem conter erros ou imprecisões. O documento original, na sua língua nativa, deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se a tradução profissional por um tradutor humano. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações erradas decorrentes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->