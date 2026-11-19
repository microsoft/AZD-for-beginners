# Capítulo 8: Padrões de Produção & Empresariais

**📚 Curso**: [AZD Para Iniciantes](../../README.md) | **⏱️ Duração**: 2-3 horas | **⭐ Complexidade**: Avançado

---

## Visão Geral

Este capítulo abrange padrões de implantação prontos para empresas, reforço de segurança, monitorização e otimização de custos para cargas de trabalho de IA em produção.

Este é um referência arquitetónica, não um template completo para implantação em produção. Os exemplos omitem detalhes de integração que devem ser fornecidos e testados na sua própria aplicação; a leitura da lista de verificação não certifica a prontidão para produção.

> **Atualização Foundry GA (2026-11-09):** Use `azd >= 1.37.0` e o pacote geralmente disponível `microsoft.foundry` 1.0 para o workflow Foundry; avaliações são instaladas separadamente. Veja [escopo de lançamento e migração](production-ai-practices.md#recent-release-changes-and-fixes) e o [exemplo de pipeline autenticado](production-ai-practices.md#cicd-pipeline-configuration). Esta é uma revisão de documentação, não uma validação de implantação ao vivo ou status GA abrangente para funcionalidades opcionais em preview.

## Objetivos de Aprendizagem

Ao completar este capítulo, você irá:
- Implantar aplicações resilientes multi-região
- Implementar padrões de segurança empresarial
- Configurar monitorização abrangente
- Otimizar custos em larga escala
- Configurar pipelines CI/CD com AZD

---

## 📚 Lições

| # | Lição | Descrição | Tempo |
|---|--------|-------------|------|
| 1 | [Práticas de IA para Produção](production-ai-practices.md) | Padrões de implantação empresarial | 90 min |

---

## 🚀 Lista de Verificação de Produção

- [ ] Implantação multi-região para resiliência
- [ ] Identidade gerida para autenticação (sem chaves)
- [ ] Application Insights para monitorização
- [ ] Orçamentos e alertas de custos configurados
- [ ] Análise de segurança ativada
- [ ] Integração de pipeline CI/CD
- [ ] Plano de recuperação de desastre

---

## 🏗️ Padrões de Arquitetura

### Padrão 1: Microserviços AI

```mermaid
graph LR
    Gateway[API Gateway] --> AI[AI Service] --> Models[Microsoft Foundry Models]
    Gateway --> Auth[Auth Service]
    AI --> Data[Data Store]
```

### Padrão 2: IA Orientada a Eventos

```mermaid
graph LR
    EventGrid[Event Grid] --> Functions[Functions] --> Pipeline[AI Pipeline]
```

---

## 🔐 Melhores Práticas de Segurança

```bicep
// Illustrative properties from different resources, NOT a standalone Bicep file.
// Attach identity to the application host:
identity: {
  type: 'SystemAssigned'
}

// AI account properties (also require private endpoints, DNS and app connectivity):
properties: {
  publicNetworkAccess: 'Disabled'
  networkAcls: {
    defaultAction: 'Deny'
  }
}
```

---

## 💰 Otimização de Custos

| Estratégia | Principal Restrição |
|----------|---------|
| Escalamento para zero (Container Apps) | Requer um trigger adequado; outros serviços ainda geram custos |
| Usar níveis de consumo para desenvolvimento | Compare o preço do serviço selecionado e a carga de trabalho |
| Escalamento programado | Escalar através da infraestrutura/automação suportada |
| Reservas/capacidade provisionada | Apenas quando suportado; compromissos podem aumentar custos em inatividade |

Use o [padrão completo para recurso de orçamento](production-ai-practices.md#2-cost-monitoring-and-budgets) com uma data de início válida, escopo de faturação, destinatários e permissões. Um orçamento envia alertas; não impõe limites de gasto. As poupanças dependem da utilização medida e não são percentagens garantidas.

---

## 📊 Configuração de Monitorização

```bash
# Open the Application Insights logs view (requires configured monitoring)
azd monitor --logs

# Check Application Insights
azd monitor --overview

# View metrics
az monitor metrics list --resource <resource-id>
```

---

## 🔗 Navegação

| Direção | Capítulo |
|-----------|---------|
| **Anterior** | [Capítulo 7: Resolução de Problemas](../chapter-07-troubleshooting/README.md) |
| **Curso Completo** | [Página Inicial do Curso](../../README.md) |

---

## 📖 Recursos Relacionados

- [Guia de Agentes de IA](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [Soluções Multi-Agente](../chapter-05-multi-agent/README.md)
- [Exemplo de Microserviços](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->