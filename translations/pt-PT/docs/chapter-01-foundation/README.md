# Capítulo 1: Fundamentos & Início Rápido

**📚 Curso**: [AZD Para Iniciantes](../../README.md) | **⏱️ Duração**: 30-45 minutos | **⭐ Complexidade**: Iniciante

---

## Visão Geral

Este capítulo introduz os fundamentos do Azure Developer CLI (azd). Irá aprender os conceitos principais, instalar as ferramentas e implementar a sua primeira aplicação no Azure.

## Objetivos de Aprendizagem

Ao concluir este capítulo, deverá:
- Compreender o que é o Azure Developer CLI e como difere do Azure CLI
- Instalar e configurar o AZD na sua plataforma
- Implementar a sua primeira aplicação no Azure com `azd up`
- Limpar os recursos com `azd down`

---

## 📚 Lições

| # | Lição | Descrição | Tempo |
|---|--------|-------------|------|
| 1 | [Conceitos Básicos do AZD](azd-basics.md) | Conceitos fundamentais, terminologia e estrutura do projeto | 15 min |
| 2 | [Instalação & Configuração](installation.md) | Guias de instalação específicos para a plataforma | 10 min |
| 3 | [O Seu Primeiro Projeto](first-project.md) | Prático: Implementar uma aplicação web no Azure | 20 min |

---

## 🚀 Início Rápido

```bash
# Verificar a instalação
azd version

# Iniciar sessão no Azure
azd auth login

# Implantar a sua primeira aplicação
azd init --template todo-nodejs-mongo
azd up

# Limpar quando terminar
azd down --force --purge
```

---

## ✅ Critérios de Sucesso

Após concluir este capítulo, deverá ser capaz de:

```bash
azd version              # Mostra a versão instalada
azd init --template todo-nodejs-mongo  # Inicializa o projeto
azd up                   # Faz o deploy para o Azure
azd show                 # Mostra a URL da aplicação em execução
azd down --force --purge # Limpa os recursos
```

---

## 🔗 Navegação

| Direction | Chapter |
|-----------|---------|
| **Próximo** | [Capítulo 2: Desenvolvimento com IA em Primeiro Lugar](../chapter-02-ai-development/README.md) |
| **Ir para** | [Capítulo 3: Configuração](../chapter-03-configuration/README.md) |

---

## 📖 Recursos Relacionados

- [Folha de Consulta de Comandos](../../resources/cheat-sheet.md)
- [Perguntas Frequentes (FAQ)](../../resources/faq.md)
- [Glossário](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Isenção de responsabilidade**:
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Apesar de nos esforçarmos por garantir a precisão, tenha em atenção que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua deve ser considerado a versão definitiva. Para informações críticas, recomenda-se a tradução profissional por um tradutor humano. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações erradas decorrentes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->