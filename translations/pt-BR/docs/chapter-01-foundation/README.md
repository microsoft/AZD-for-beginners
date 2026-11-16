# Capítulo 1: Fundamentos & Início Rápido

**📚 Curso**: [AZD Para Iniciantes](../../README.md) | **⏱️ Duração**: 75-120 minutos incluindo o primeiro deploy; exercícios adicionais levam mais tempo | **⭐ Complexidade**: Iniciante

---

## Visão Geral

Este capítulo apresenta os fundamentos do Azure Developer CLI (azd). Você aprenderá conceitos básicos, instalará as ferramentas e fará o deploy do seu primeiro aplicativo no Azure.

> Revisão de comandos e configuração com alvo: `azd 1.37.2` (novembro de 2026). Provisionamento ao vivo no Azure não foi executado durante a revisão.

## Objetivos de Aprendizagem

Ao concluir este capítulo, você irá:
- Entender o que é o Azure Developer CLI e como ele difere do Azure CLI
- Instalar e configurar o AZD na sua plataforma
- Fazer o deploy do seu primeiro aplicativo no Azure com `azd up`
- Limpar recursos com `azd down`

---

## 📚 Aulas

| # | Aula | Descrição | Tempo |
|---|--------|-------------|------|
| 1 | [Noções Básicas do AZD](azd-basics.md) | Conceitos principais, terminologia e estrutura do projeto | 15 min |
| 2 | [Instalação & Configuração](installation.md) | Guias de instalação para plataformas específicas | 10 min |
| 3 | [Seu Primeiro Projeto](first-project.md) | Mão na massa: Fazer deploy de um app web no Azure | 20 min |
| 4 | [Traga Seu Próprio App](bring-your-own-app.md) | Adicione azd a um projeto existente que você já tenha | 15 min |
| 5 | [Contêineres de Desenvolvimento & Codespaces](dev-containers.md) | Ambientes azd reprodutíveis com dev containers | 15 min |

---

## ✅ Comece Aqui: Valide Sua Configuração

Antes de começar, confirme que sua máquina local está pronta para o template do Capítulo 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Se o script indicar ferramentas faltando, corrija isso primeiro e depois continue com o capítulo.

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

Depois de concluir este capítulo, você deverá ser capaz de:

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
|---------|----------|
| **Próximo** | [Capítulo 2: Desenvolvimento AI-First](../chapter-02-ai-development/README.md) |
| **Pular para** | [Capítulo 3: Configuração](../chapter-03-configuration/README.md) |

---

## 📖 Recursos Relacionados

- [Folha de Comandos](../../resources/cheat-sheet.md)
- [Perguntas Frequentes](../../resources/faq.md)
- [Glossário](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->