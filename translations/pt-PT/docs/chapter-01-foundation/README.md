# Capítulo 1: Fundamentos & Início Rápido

**📚 Curso**: [AZD Para Iniciantes](../../README.md) | **⏱️ Duração**: 30-45 minutos | **⭐ Complexidade**: Iniciante

---

## Visão Geral

Este capítulo apresenta os fundamentos do Azure Developer CLI (azd). Irá aprender os conceitos principais, instalar as ferramentas e implementar a sua primeira aplicação no Azure.

> Validado com `azd 1.23.12` em março de 2026.

## Objetivos de Aprendizagem

Ao concluir este capítulo, você irá:
- Compreender o que é o Azure Developer CLI e como ele difere do Azure CLI
- Instalar e configurar o AZD na sua plataforma
- Implementar a sua primeira aplicação no Azure com `azd up`
- Limpar os recursos com `azd down`

---

## 📚 Lições

| # | Lição | Descrição | Tempo |
|---|--------|-------------|------|
| 1 | [Noções Básicas do AZD](azd-basics.md) | Conceitos essenciais, terminologia e estrutura de projeto | 15 min |
| 2 | [Instalação & Configuração](installation.md) | Guias de instalação específicos para a plataforma | 10 min |
| 3 | [O Seu Primeiro Projeto](first-project.md) | Prática: Implementar uma aplicação web no Azure | 20 min |

---

## ✅ Comece Aqui: Valide a Sua Configuração

Antes de começar, confirme que a sua máquina local está pronta para o modelo do Capítulo 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Se o script indicar que faltam ferramentas, corrija primeiro esses problemas e depois continue com o capítulo.

---

## 🚀 Início Rápido

```bash
# Verificar instalação
azd version

# Autenticar para AZD
# Opcional: az login se planeia executar comandos Azure CLI diretamente
azd auth login

# Desplegar a sua primeira aplicação
azd init --template todo-nodejs-mongo
azd up

# Limpar quando terminar
azd down --force --purge
```

---

## ✅ Critérios de Sucesso

Depois de concluir este capítulo, deverá ser capaz de:

```bash
azd version              # Mostra a versão instalada
azd init --template todo-nodejs-mongo  # Inicializa o projeto
azd up                   # Desdobra para o Azure
azd show                 # Mostra a URL da aplicação em execução
azd down --force --purge # Limpa os recursos
```

---

## 🔗 Navegação

| Direção | Capítulo |
|-----------|---------|
| **Seguinte** | [Capítulo 2: Desenvolvimento AI-First](../chapter-02-ai-development/README.md) |
| **Pular para** | [Capítulo 3: Configuração](../chapter-03-configuration/README.md) |

---

## 📖 Recursos Relacionados

- [Ficha Rápida de Comandos](../../resources/cheat-sheet.md)
- [FAQ](../../resources/faq.md)
- [Glossário](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos por garantir a precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->