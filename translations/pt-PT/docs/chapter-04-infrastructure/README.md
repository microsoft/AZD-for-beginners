# Capítulo 4: Infraestrutura como Código & Implantação

**📚 Curso**: [AZD Para Iniciantes](../../README.md) | **⏱️ Duração**: 2-3 horas de leitura; permita tempo extra para exercícios de implantação | **⭐ Complexidade**: Intermédio

---

## Visão Geral

Este capítulo aborda padrões de Infraestrutura como Código (IaC) com modelos Bicep, o aprovisionamento de recursos e estratégias de implantação usando Azure Developer CLI.

> Revisão de comandos e configuração alvo: `azd 1.37.2` (Novembro 2026). O aprovisionamento ativo no Azure não foi executado durante a revisão.

## Objetivos de Aprendizagem

Ao completar este capítulo, irá:
- Compreender a estrutura e a sintaxe dos modelos Bicep
- Aprovisionar recursos Azure com `azd provision`
- Implantar aplicações com `azd deploy`
- Implementar estratégias de implantação blue-green e rolling

---

## 📚 Lições

| # | Lição | Descrição | Tempo |
|---|--------|-------------|------|
| 1 | [Aprovisionamento de Recursos](provisioning.md) | Gestão de recursos Azure com AZD | 45 min |
| 2 | [Guia de Implantação](deployment-guide.md) | Estratégias de implantação de aplicações | 45 min |
| 3 | [Criar o Seu Próprio Modelo](custom-templates.md) | Construir e publicar modelos azd reutilizáveis | 30 min |

---

## 🚀 Início Rápido

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
| `azd provision` | Criar recursos Azure |
| `azd deploy` | Implantar código da aplicação |
| `azd up` | aprovisionar + implantar |
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
- [Exemplos de Aplicações Container](../../examples/container-app/README.md)
- [Exemplo de Aplicação Base de Dados](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->