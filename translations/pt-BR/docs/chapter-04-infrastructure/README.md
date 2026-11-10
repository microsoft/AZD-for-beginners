# Capítulo 4: Infraestrutura como Código & Implantação

**📚 Curso**: [AZD Para Iniciantes](../../README.md) | **⏱️ Duração**: 2-3 horas de leitura; reserve tempo extra para exercícios de implantação | **⭐ Complexidade**: Intermediário

---

## Visão Geral

Este capítulo aborda padrões de Infraestrutura como Código (IaC) com templates Bicep, provisionamento de recursos e estratégias de implantação usando Azure Developer CLI.

> Revisão de comandos e configuração alvo: `azd 1.37.2` (Novembro de 2026). Provisionamento ativo no Azure não foi executado durante a revisão.

## Objetivos de Aprendizagem

Ao concluir este capítulo, você irá:
- Entender a estrutura e sintaxe de templates Bicep
- Provisionar recursos Azure com `azd provision`
- Implantar aplicações com `azd deploy`
- Implementar estratégias de implantação blue-green e rolling

---

## 📚 Aulas

| # | Aula | Descrição | Tempo |
|---|--------|-------------|------|
| 1 | [Provisionamento de Recursos](provisioning.md) | Gerenciamento de recursos Azure com AZD | 45 min |
| 2 | [Guia de Implantação](deployment-guide.md) | Estratégias de implantação de aplicações | 45 min |
| 3 | [Criando Seu Próprio Template](custom-templates.md) | Criar e publicar templates azd reutilizáveis | 30 min |

---

## 🚀 Começando Rápido

```bash
# Initialize from template
mkdir infrastructure-practice
cd infrastructure-practice
azd init --template todo-nodejs-mongo .
azd auth login

# Preview what will be created
azd provision --preview

# Provision infrastructure only
azd provision

# Deploy code only
azd deploy

# Or both together
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
- [Exemplos de Container Apps](../../examples/container-app/README.md)
- [Exemplo de Aplicação de Banco de Dados](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->