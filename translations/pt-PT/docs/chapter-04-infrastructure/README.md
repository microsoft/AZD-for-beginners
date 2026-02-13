# Capítulo 4: Infraestrutura como Código & Implantação

**📚 Curso**: [AZD para Iniciantes](../../README.md) | **⏱️ Duração**: 1-1.5 horas | **⭐ Complexidade**: Intermédio

---

## Visão Geral

This chapter covers Infrastructure as Code (IaC) patterns with Bicep templates, resource provisioning, and deployment strategies using Azure Developer CLI.

## Objetivos de Aprendizagem

Ao completar este capítulo, irá:
- Compreender a estrutura e a sintaxe de templates Bicep
- Provisionar recursos Azure com `azd provision`
- Implantar aplicações com `azd deploy`
- Implementar estratégias de deploy blue-green e rolling

---

## 📚 Lições

| # | Lição | Descrição | Duração |
|---|--------|-------------|------|
| 1 | [Provisionamento de Recursos](provisioning.md) | Gestão de recursos do Azure com AZD | 45 min |
| 2 | [Guia de Implantação](deployment-guide.md) | Estratégias de implantação de aplicações | 45 min |

---

## 🚀 Início Rápido

```bash
# Inicializar a partir do modelo
azd init --template azure-functions-python-v2-http

# Pré-visualizar o que será criado
azd provision --preview

# Apenas provisionar a infraestrutura
azd provision

# Apenas implantar o código
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
| `azd init` | Inicializar o projeto |
| `azd provision` | Criar recursos no Azure |
| `azd deploy` | Implantar o código da aplicação |
| `azd up` | provisionar + implantar |
| `azd down` | Eliminar todos os recursos |

---

## 🔗 Navegação

| Direção | Capítulo |
|-----------|---------|
| **Anterior** | [Capítulo 3: Configuração](../chapter-03-configuration/README.md) |
| **Seguinte** | [Capítulo 5: Soluções Multi-Agente](../chapter-05-multi-agent/README.md) |

---

## 📖 Recursos Relacionados

- [Verificações pré-implantação](../chapter-06-pre-deployment/README.md)
- [Exemplos de aplicações Container](../../examples/container-app/README.md)
- [Exemplo de aplicação de base de dados](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Isenção de responsabilidade:
Este documento foi traduzido utilizando o serviço de tradução automática por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos por garantir a precisão, esteja ciente de que as traduções automáticas podem conter erros ou imprecisões. O documento original, no seu idioma de origem, deve ser considerado a fonte autorizada. Para informação crítica, recomenda-se uma tradução profissional efetuada por um tradutor humano. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->