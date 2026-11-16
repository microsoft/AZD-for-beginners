# Capítulo 1: Fundamentos & Início Rápido

**📚 Curso**: [AZD Para Iniciantes](../../README.md) | **⏱️ Duração**: 75-120 minutos incluindo o primeiro deployment; exercícios adicionais levam mais tempo | **⭐ Complexidade**: Iniciante

---

## Visão Geral

Este capítulo introduz os fundamentos do Azure Developer CLI (azd). Vai aprender conceitos essenciais, instalar as ferramentas e fazer o deploy da sua primeira aplicação no Azure.

> Revisão de comando e configuração alvo: `azd 1.37.2` (Novembro 2026). O provisionamento ao vivo no Azure não foi executado durante a revisão.

## Objetivos de Aprendizagem

Ao completar este capítulo, vai:
- Perceber o que é o Azure Developer CLI e como difere do Azure CLI
- Instalar e configurar o AZD na sua plataforma
- Fazer o deploy da sua primeira aplicação no Azure com `azd up`
- Limpar recursos com `azd down`

---

## 📚 Lições

| # | Lição | Descrição | Duração |
|---|--------|-------------|------|
| 1 | [Noções Básicas do AZD](azd-basics.md) | Conceitos principais, terminologia e estrutura de projeto | 15 min |
| 2 | [Instalação & Configuração](installation.md) | Guias de instalação específicos para plataforma | 10 min |
| 3 | [O Seu Primeiro Projeto](first-project.md) | Prático: Faça o deploy de uma web app no Azure | 20 min |
| 4 | [Traga a Sua Própria App](bring-your-own-app.md) | Adicione o azd a um projeto existente que já tenha | 15 min |
| 5 | [Contêineres de Desenvolvimento & Codespaces](dev-containers.md) | Ambientes azd reprodutíveis com contêineres dev | 15 min |

---

## ✅ Comece Aqui: Valide a Sua Configuração

Antes de começar, confirme que a sua máquina local está pronta para o template do Capítulo 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Se o script reportar ferramentas em falta, corrija isso primeiro e depois continue com o capítulo.

---

## 🚀 Início Rápido

```bash
# Check installation
azd version

# Authenticate for AZD
# Optional: az login if you plan to run Azure CLI commands directly
azd auth login

# Deploy your first app
mkdir chapter1-demo
cd chapter1-demo
azd init --template todo-nodejs-mongo .
azd up

# Clean up when done
azd down --force --purge
```

---

## ✅ Critérios de Sucesso

Depois de completar este capítulo, deverá ser capaz de:

```bash
azd version              # Shows installed version
azd env list             # Lists the initialized environment
azd up                   # Deploys to Azure
azd show                 # Displays running app URL
azd down --force --purge # Cleans up resources
```

---

## 🔗 Navegação

| Direção | Capítulo |
|-----------|---------|
| **Próximo** | [Capítulo 2: Desenvolvimento AI-First](../chapter-02-ai-development/README.md) |
| **Pular para** | [Capítulo 3: Configuração](../chapter-03-configuration/README.md) |

---

## 📖 Recursos Relacionados

- [Folha de Comandos de Comando](../../resources/cheat-sheet.md)
- [FAQ](../../resources/faq.md)
- [Glossário](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->