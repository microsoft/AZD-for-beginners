# Capítulo 4: Infraestrutura como Código & Implantação

**📚 Curso**: [AZD Para Iniciantes](../../README.md) | **⏱️ Duração**: 1-1.5 horas | **⭐ Complexidade**: Intermédio

---

## Visão Geral

Este capítulo cobre padrões de Infraestrutura como Código (IaC) com templates Bicep, provisão de recursos e estratégias de implantação usando Azure Developer CLI.

> Validado contra `azd 1.23.12` em março de 2026.

## Objetivos de Aprendizagem

Ao concluir este capítulo, irá:
- Compreender a estrutura e sintaxe do template Bicep
- Prover recursos do Azure com `azd provision`
- Implantar aplicações com `azd deploy`
- Implementar estratégias de implantação blue-green e rolling

---

## 📚 lições

| # | Lição | Descrição | Tempo |
|---|--------|-------------|------|
| 1 | [Provisionamento de Recursos](provisioning.md) | Gestão de recursos Azure com AZD | 45 min |
| 2 | [Guia de Implantação](deployment-guide.md) | Estratégias de implantação de aplicações | 45 min |

---

## 🚀 Início Rápido

```bash
# Inicializar a partir do modelo
azd init --template azure-functions-python-v2-http

# Pré-visualizar o que será criado
azd provision --preview

# Provisionar apenas a infraestrutura
azd provision

# Desdobrar apenas o código
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
| `azd provision` | Criar recursos Azure |
| `azd deploy` | Implantar código da aplicação |
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

- [Verificações Pré-Implantação](../chapter-06-pre-deployment/README.md)
- [Exemplos de Container App](../../examples/container-app/README.md)
- [Exemplo de Aplicação de Base de Dados](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor tenha em consideração que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se a tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações erradas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->