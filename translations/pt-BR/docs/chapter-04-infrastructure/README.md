# Chapter 4: Infraestrutura como Código & Implantação

**📚 Curso**: [AZD Para Iniciantes](../../README.md) | **⏱️ Duration**: 1-1.5 hours | **⭐ Complexity**: Intermediário

---

## Visão Geral

Este capítulo aborda padrões de Infraestrutura como Código (IaC) com templates Bicep, provisionamento de recursos e estratégias de implantação usando o Azure Developer CLI.

> Validado contra `azd 1.23.12` em março de 2026.

## Objetivos de Aprendizagem

Ao concluir este capítulo, você irá:
- Entender a estrutura e a sintaxe dos templates Bicep
- Provisionar recursos do Azure com `azd provision`
- Implantar aplicações com `azd deploy`
- Implementar estratégias de implantação blue-green e rolling

---

## 📚 Lições

| # | Lição | Descrição | Tempo |
|---|--------|-------------|------|
| 1 | [Provisionamento de Recursos](provisioning.md) | Gerenciamento de recursos do Azure com AZD | 45 min |
| 2 | [Guia de Implantação](deployment-guide.md) | Estratégias de implantação de aplicações | 45 min |

---

## 🚀 Início Rápido

```bash
# Inicializar a partir do modelo
azd init --template azure-functions-python-v2-http

# Visualizar o que será criado
azd provision --preview

# Provisionar apenas a infraestrutura
azd provision

# Implantar apenas o código
azd deploy

# Ou ambos juntos
azd up
```

---

## 📁 Estrutura do Projeto AZD

```
my-project/
├── azure.yaml            # ← Project definition
├── infra/                # ← Infrastructure as Code
│   ├── main.bicep        # Entry point
│   ├── main.parameters.json
│   └── modules/          # Reusable components
│       ├── web.bicep
│       └── database.bicep
└── src/                  # Application code
    └── api/
```

---

## 🔧 Comandos Essenciais

| Comando | Descrição |
|---------|-------------|
| `azd init` | Inicializar projeto |
| `azd provision` | Criar recursos do Azure |
| `azd deploy` | Implantar código da aplicação |
| `azd up` | provisionar + implantar |
| `azd down` | Excluir todos os recursos |

---

## 🔗 Navegação

| Direção | Capítulo |
|-----------|---------|
| **Anterior** | [Capítulo 3: Configuração](../chapter-03-configuration/README.md) |
| **Próximo** | [Capítulo 5: Soluções Multi-Agente](../chapter-05-multi-agent/README.md) |

---

## 📖 Recursos Relacionados

- [Verificações Pré-Implantação](../chapter-06-pre-deployment/README.md)
- [Exemplos de Aplicativos em Container](../../examples/container-app/README.md)
- [Exemplo de Aplicativo de Banco de Dados](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Isenção de responsabilidade**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução humana profissional. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->