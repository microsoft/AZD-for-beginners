# Chapter 1: Fundamentos & Início Rápido

**📚 Curso**: [AZD Para Iniciantes](../../README.md) | **⏱️ Duração**: 30-45 minutos | **⭐ Complexidade**: Iniciante

---

## Visão Geral

Este capítulo introduz os fundamentos do Azure Developer CLI (azd). Você aprenderá os conceitos principais, instalará as ferramentas e implantará sua primeira aplicação no Azure.

> Validado contra `azd 1.23.12` em março de 2026.

## Objetivos de Aprendizagem

By completing this chapter, you will:
- Entender o que é o Azure Developer CLI e como ele difere do Azure CLI
- Instalar e configurar o AZD na sua plataforma
- Implantar sua primeira aplicação no Azure com `azd up`
- Limpar recursos com `azd down`

---

## 📚 Aulas

| # | Aula | Descrição | Tempo |
|---|--------|-------------|------|
| 1 | [Conceitos Básicos do AZD](azd-basics.md) | Conceitos principais, terminologia e estrutura do projeto | 15 min |
| 2 | [Instalação e Configuração](installation.md) | Guias de instalação específicos para cada plataforma | 10 min |
| 3 | [Seu Primeiro Projeto](first-project.md) | Prática: Implantar um aplicativo web no Azure | 20 min |

---

## ✅ Comece Aqui: Valide Sua Configuração

Antes de começar, confirme se sua máquina local está pronta para o template do Capítulo 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Se o script relatar ferramentas ausentes, corrija isso primeiro e depois continue com o capítulo.

---

## 🚀 Início Rápido

```bash
# Verifique a instalação
azd version

# Autenticar para o AZD
# Opcional: az login se você planeja executar comandos do Azure CLI diretamente
azd auth login

# Implante seu primeiro app
azd init --template todo-nodejs-mongo
azd up

# Limpe quando terminar
azd down --force --purge
```

---

## ✅ Critérios de Sucesso

Após concluir este capítulo, você deverá ser capaz de:

```bash
azd version              # Mostra a versão instalada
azd init --template todo-nodejs-mongo  # Inicializa o projeto
azd up                   # Implanta no Azure
azd show                 # Exibe a URL do aplicativo em execução
azd down --force --purge # Limpa os recursos
```

---

## 🔗 Navegação

| Direção | Capítulo |
|-----------|---------|
| **Next** | [Capítulo 2: Desenvolvimento com IA em Primeiro Lugar](../chapter-02-ai-development/README.md) |
| **Skip to** | [Capítulo 3: Configuração](../chapter-03-configuration/README.md) |

---

## 📖 Recursos Relacionados

- [Resumo de Comandos](../../resources/cheat-sheet.md)
- [Perguntas Frequentes](../../resources/faq.md)
- [Glossário](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Isenção de responsabilidade**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se tradução humana profissional. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->