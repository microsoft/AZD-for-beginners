# Capítulo 4: Infraestrutura como Código & Implantação

**📚 Curso**: [AZD Para Iniciantes](../../README.md) | **⏱️ Duração**: 1-1.5 horas | **⭐ Complexidade**: Intermédio

---

## Visão Geral

Este capítulo cobre padrões de Infraestrutura como Código (IaC) com templates Bicep, provisionamento de recursos e estratégias de implantação usando o Azure Developer CLI.

> Validado com `azd 1.25.6` em junho de 2026.

## Objetivos de Aprendizagem

Ao concluir este capítulo, você irá:
- Compreender a estrutura e sintaxe dos templates Bicep
- Provisionar recursos Azure com `azd provision`
- Implantar aplicações com `azd deploy`
- Implementar estratégias de implantação blue-green e rolling

---

## 📚 Lições

| # | Lição | Descrição | Tempo |
|---|--------|-------------|------|
| 1 | [Provisionar Recursos](provisioning.md) | Gestão de recursos Azure com AZD | 45 min |
| 2 | [Guia de Implantação](deployment-guide.md) | Estratégias de implantação de aplicações | 45 min |
| 3 | [Criar o Seu Próprio Template](custom-templates.md) | Construir e publicar templates azd reutilizáveis | 30 min |

---

## 🚀 Início Rápido

```bash
# Inicializar a partir do modelo
azd init --template azure-functions-python-v2-http

# Pré-visualizar o que será criado
azd provision --preview

# Provisionar apenas a infraestrutura
azd provision

# Implementar apenas o código
azd deploy

# Ou ambos em conjunto
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
| `azd provision` | Criar recursos Azure |
| `azd deploy` | Implantar código da aplicação |
| `azd up` | provisionar + implantar |
| `azd down` | Apagar todos os recursos |

---

## 🔗 Navegação

| Direção | Capítulo |
|-----------|---------|
| **Anterior** | [Capítulo 3: Configuração](../chapter-03-configuration/README.md) |
| **Seguinte** | [Capítulo 5: Soluções Multi-Agente](../chapter-05-multi-agent/README.md) |

---

## 📖 Recursos Relacionados

- [Verificações Pré-Implantação](../chapter-06-pre-deployment/README.md)
- [Exemplos de Aplicações em Container](../../examples/container-app/README.md)
- [Exemplo de Aplicação de Base de Dados](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->