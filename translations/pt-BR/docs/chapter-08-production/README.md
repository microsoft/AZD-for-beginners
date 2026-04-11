# Capítulo 8: Padrões de Produção e Empresariais

**📚 Curso**: [AZD Para Iniciantes](../../README.md) | **⏱️ Duração**: 2-3 hours | **⭐ Complexidade**: Avançado

---

## Visão geral

Este capítulo aborda padrões de implantação prontos para empresas, fortalecimento de segurança, monitoramento e otimização de custos para cargas de trabalho de IA em produção.

> Validado com `azd 1.23.12` em março de 2026.

## Objetivos de aprendizagem

Ao concluir este capítulo, você irá:
- Implantar aplicações resilientes em várias regiões
- Implementar padrões de segurança empresariais
- Configurar monitoramento abrangente
- Otimizar custos em escala
- Configurar pipelines de CI/CD com AZD

---

## 📚 Lições

| # | Aula | Descrição | Tempo |
|---|--------|-------------|------|
| 1 | [Práticas de IA em Produção](production-ai-practices.md) | Padrões de implantação empresariais | 90 min |

---

## 🚀 Checklist de Produção

- [ ] Implantação multi-região para resiliência
- [ ] Identidade gerenciada para autenticação (sem chaves)
- [ ] Application Insights para monitoramento
- [ ] Orçamentos de custo e alertas configurados
- [ ] Varredura de segurança habilitada
- [ ] Integração com pipeline CI/CD
- [ ] Plano de recuperação de desastres

---

## 🏗️ Padrões de Arquitetura

### Padrão 1: IA em Microsserviços

```mermaid
graph LR
    Gateway[Gateway de API] --> AI[Serviço de IA] --> Models[Modelos da Microsoft Foundry]
    Gateway --> Auth[Serviço de Autenticação]
    AI --> Data[Armazenamento de Dados]
```
### Padrão 2: IA Orientada a Eventos

```mermaid
graph LR
    EventGrid[Grade de Eventos] --> Functions[Funções] --> Pipeline[Pipeline de IA]
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
| Escalar para zero (Container Apps) | 60-80% |
| Usar níveis de consumo para desenvolvimento | 50-70% |
| Escalonamento programado | 30-50% |
| Capacidade reservada | 20-40% |

```bash
# Definir alertas de orçamento
az consumption budget create \
  --budget-name "AI-Budget" \
  --amount 500 \
  --category Cost \
  --time-grain Monthly
```

---

## 📊 Configuração de Monitoramento

```bash
# Transmitir logs
azd monitor --logs

# Verificar o Application Insights
azd monitor --overview

# Ver métricas
az monitor metrics list --resource <resource-id>
```

---

## 🔗 Navegação

| Direção | Capítulo |
|-----------|---------|
| **Anterior** | [Capítulo 7: Solução de Problemas](../chapter-07-troubleshooting/README.md) |
| **Curso Concluído** | [Início do Curso](../../README.md) |

---

## 📖 Recursos Relacionados

- [Guia de Agentes de IA](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [Soluções Multi-Agente](../chapter-05-multi-agent/README.md)
- [Exemplo de Microsserviços](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Isenção de responsabilidade**:
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se uma tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->