# Chapter 1: Foundation & Quick Start

**📚 Curso**: [AZD para Iniciantes](../../README.md) | **⏱️ Duração**: 30-45 minutes | **⭐ Complexidade**: Iniciante

---

## Visão Geral

Este capítulo apresenta os fundamentos do Azure Developer CLI (azd). Você aprenderá os conceitos principais, instalará as ferramentas e implantará sua primeira aplicação no Azure.

## Objetivos de Aprendizagem

Ao concluir este capítulo, você irá:
- Entender o que é o Azure Developer CLI e como ele difere do Azure CLI
- Instalar e configurar o AZD na sua plataforma
- Implantar sua primeira aplicação no Azure com `azd up`
- Limpar os recursos com `azd down`

---

## 📚 Lessons

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [AZD Basics](azd-basics.md) | Conceitos principais, terminologia e estrutura do projeto | 15 min |
| 2 | [Installation & Setup](installation.md) | Guias de instalação específicos por plataforma | 10 min |
| 3 | [Your First Project](first-project.md) | Prático: implantar um aplicativo web no Azure | 20 min |

---

## 🚀 Início Rápido

```bash
# Verifique a instalação
azd version

# Faça login no Azure
azd auth login

# Implante seu primeiro aplicativo
azd init --template todo-nodejs-mongo
azd up

# Limpe quando terminar
azd down --force --purge
```

---

## ✅ Critérios de Sucesso

Após concluir este capítulo, você deverá ser capaz de:

```bash
azd version              # Exibe a versão instalada
azd init --template todo-nodejs-mongo  # Inicializa o projeto
azd up                   # Faz o deploy para o Azure
azd show                 # Exibe a URL do aplicativo em execução
azd down --force --purge # Limpa os recursos
```

---

## 🔗 Navegação

| Direction | Chapter |
|-----------|---------|
| **Próximo** | [Capítulo 2: Desenvolvimento Orientado por IA](../chapter-02-ai-development/README.md) |
| **Pular para** | [Capítulo 3: Configuração](../chapter-03-configuration/README.md) |

---

## 📖 Recursos Relacionados

- [Resumo de Comandos](../../resources/cheat-sheet.md)
- [Perguntas Frequentes](../../resources/faq.md)
- [Glossário](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em sua língua nativa deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se tradução humana profissional. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->