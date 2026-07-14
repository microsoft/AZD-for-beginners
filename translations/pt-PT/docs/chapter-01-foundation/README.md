# Capítulo 1: Fundamentos & Arranque Rápido

**📚 Curso**: [AZD Para Iniciantes](../../README.md) | **⏱️ Duração**: 30-45 minutos | **⭐ Complexidade**: Iniciante

---

## Visão Geral

Este capítulo apresenta os fundamentos do Azure Developer CLI (azd). Vai aprender conceitos essenciais, instalar as ferramentas e implementar a sua primeira aplicação no Azure.

> Validado com `azd 1.27.1` em julho de 2026.

## Objetivos de Aprendizagem

Ao completar este capítulo, irá:
- Compreender o que é o Azure Developer CLI e como difere do Azure CLI
- Instalar e configurar o AZD na sua plataforma
- Implementar a sua primeira aplicação no Azure com `azd up`
- Limpar os recursos com `azd down`

---

## 📚 Lições

| # | Lição | Descrição | Tempo |
|---|--------|-------------|------|
| 1 | [Noções Básicas do AZD](azd-basics.md) | Conceitos principais, terminologia, e estrutura do projeto | 15 min |
| 2 | [Instalação & Configuração](installation.md) | Guias de instalação específicos para cada plataforma | 10 min |
| 3 | [O Seu Primeiro Projeto](first-project.md) | Prático: Implementar uma aplicação web no Azure | 20 min |
| 4 | [Traga a Sua Própria App](bring-your-own-app.md) | Adicionar azd a um projeto existente que já tem | 15 min |
| 5 | [Contentores de Desenvolvimento & Codespaces](dev-containers.md) | Ambientes azd reproduzíveis com contentores de desenvolvimento | 15 min |

---

## ✅ Comece Aqui: Verifique a Sua Configuração

Antes de começar, confirme que a sua máquina local está pronta para o modelo do Capítulo 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Se o script indicar ferramentas em falta, corrija essas primeiras e depois continue com o capítulo.

---

## 🚀 Arranque Rápido

```bash
# Verificar a instalação
azd version

# Autenticar para AZD
# Opcional: az login se pretender executar comandos Azure CLI diretamente
azd auth login

# Desplegar a sua primeira aplicação
azd init --template todo-nodejs-mongo
azd up

# Limpar após terminar
azd down --force --purge
```

---

## ✅ Critérios de Sucesso

Depois de completar este capítulo, deverá ser capaz de:

```bash
azd version              # Mostra a versão instalada
azd init --template todo-nodejs-mongo  # Inicializa o projeto
azd up                   # Desdobra para Azure
azd show                 # Mostra a URL da aplicação em execução
azd down --force --purge # Limpa os recursos
```

---

## 🔗 Navegação

| Direção | Capítulo |
|-----------|---------|
| **Próximo** | [Capítulo 2: Desenvolvimento AI-First](../chapter-02-ai-development/README.md) |
| **Ir Para** | [Capítulo 3: Configuração](../chapter-03-configuration/README.md) |

---

## 📖 Recursos Relacionados

- [Folha de Consulta de Comandos](../../resources/cheat-sheet.md)
- [FAQ](../../resources/faq.md)
- [Glossário](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->