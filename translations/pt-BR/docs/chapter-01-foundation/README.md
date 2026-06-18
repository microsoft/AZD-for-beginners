# Capítulo 1: Fundamentos e Início Rápido

**📚 Curso**: [AZD For Beginners](../../README.md) | **⏱️ Duração**: 30-45 minutes | **⭐ Complexidade**: Beginner

---

## Visão Geral

Este capítulo apresenta os fundamentos do Azure Developer CLI (azd). Você aprenderá os conceitos principais, instalará as ferramentas e fará o deploy do seu primeiro aplicativo no Azure.

> Validado com `azd 1.25.6` em junho de 2026.

## Objetivos de Aprendizagem

Ao concluir este capítulo, você irá:
- Entender o que é o Azure Developer CLI e como ele difere do Azure CLI
- Instalar e configurar o AZD na sua plataforma
- Fazer o deploy do seu primeiro aplicativo no Azure com `azd up`
- Limpar recursos com `azd down`

---

## 📚 Lições

| # | Lição | Descrição | Tempo |
|---|--------|-------------|------|
| 1 | [Noções Básicas do AZD](azd-basics.md) | Conceitos principais, terminologia e estrutura do projeto | 15 min |
| 2 | [Instalação & Configuração](installation.md) | Guias de instalação específicos por plataforma | 10 min |
| 3 | [Seu Primeiro Projeto](first-project.md) | Mão na massa: Faça o deploy de um app web no Azure | 20 min |
| 4 | [Use Seu Próprio Aplicativo](bring-your-own-app.md) | Adicione azd a um projeto existente que você já tem | 15 min |
| 5 | [Contêineres de Desenvolvimento & Codespaces](dev-containers.md) | Ambientes azd reprodutíveis com contêineres de desenvolvimento | 15 min |

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

Se o script relatar ferramentas ausentes, corrija isso primeiro e então continue com o capítulo.

---

## 🚀 Início Rápido

```bash
# Verifique a instalação
azd version

# Autentique-se para o AZD
# Opcional: az login se você pretende executar comandos da Azure CLI diretamente
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
| **Próximo** | [Capítulo 2: Desenvolvimento com foco em IA](../chapter-02-ai-development/README.md) |
| **Pular para** | [Capítulo 3: Configuração](../chapter-03-configuration/README.md) |

---

## 📖 Recursos Relacionados

- [Folha de Referência de Comandos](../../resources/cheat-sheet.md)
- [FAQ](../../resources/faq.md)
- [Glossário](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->