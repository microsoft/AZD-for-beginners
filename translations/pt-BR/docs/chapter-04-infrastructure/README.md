# Capítulo 4: Infraestrutura como Código & Implantação

**📚 Curso**: [AZD Para Iniciantes](../../README.md) | **⏱️ Duração**: 1-1,5 horas | **⭐ Complexidade**: Intermediário

---

## Visão Geral

Este capítulo aborda padrões de Infrastructure as Code (IaC) com templates Bicep, provisionamento de recursos e estratégias de implantação usando o Azure Developer CLI.

> Validado com `azd 1.25.6` em junho de 2026.

## Objetivos de Aprendizagem

Ao concluir este capítulo, você irá:
- Compreender a estrutura e a sintaxe de templates Bicep
- Provisionar recursos do Azure com `azd provision`
- Implantar aplicações com `azd deploy`
- Implementar estratégias de implantação blue-green e rolling

---

## 📚 Aulas

| # | Lição | Descrição | Tempo |
|---|--------|-------------|------|
| 1 | [Provisioning Resources](provisioning.md) | Gerenciamento de recursos do Azure com AZD | 45 min |
| 2 | [Deployment Guide](deployment-guide.md) | Estratégias de implantação de aplicações | 45 min |
| 3 | [Authoring Your Own Template](custom-templates.md) | Criar e publicar modelos azd reutilizáveis | 30 min |

---

## 🚀 Quick Start

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

## 📁 AZD Project Structure

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

## 🔧 Essential Commands

| Command | Description |
|---------|-------------|
| `azd init` | Inicializar o projeto |
| `azd provision` | Criar recursos do Azure |
| `azd deploy` | Implantar o código da aplicação |
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

- [Verificações pré-implantação](../chapter-06-pre-deployment/README.md)
- [Exemplos de Container App](../../examples/container-app/README.md)
- [Exemplo de Aplicação de Banco de Dados](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->