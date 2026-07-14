# Capítulo 1: Fundamentos & Início Rápido

**📚 Curso**: [AZD Para Iniciantes](../../README.md) | **⏱️ Duração**: 30-45 minutos | **⭐ Complexidade**: Iniciante

---

## Visão Geral

Este capítulo apresenta os fundamentos do Azure Developer CLI (azd). Você aprenderá conceitos básicos, instalará as ferramentas e implantará sua primeira aplicação no Azure.

> Validado com `azd 1.27.1` em julho de 2026.

## Objetivos de Aprendizagem

Ao concluir este capítulo, você irá:
- Entender o que é o Azure Developer CLI e como ele difere do Azure CLI
- Instalar e configurar o AZD na sua plataforma
- Implantar sua primeira aplicação no Azure com `azd up`
- Limpar recursos com `azd down`

---

## 📚 Lições

| # | Lição | Descrição | Tempo |
|---|--------|-------------|------|
| 1 | [Noções Básicas do AZD](azd-basics.md) | Conceitos principais, terminologia e estrutura do projeto | 15 min |
| 2 | [Instalação & Configuração](installation.md) | Guias de instalação específicos por plataforma | 10 min |
| 3 | [Seu Primeiro Projeto](first-project.md) | Prática: Implante um app web no Azure | 20 min |
| 4 | [Traga Seu Próprio App](bring-your-own-app.md) | Adicione o azd a um projeto existente que você já tem | 15 min |
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

Se o script informar ferramentas ausentes, corrija isso primeiro e depois continue com o capítulo.

---

## 🚀 Início Rápido

```bash
# Verificar instalação
azd version

# Autenticar para AZD
# Opcional: az login se você planeja executar comandos do Azure CLI diretamente
azd auth login

# Implante seu primeiro aplicativo
azd init --template todo-nodejs-mongo
azd up

# Limpar após terminar
azd down --force --purge
```

---

## ✅ Critérios de Sucesso

Depois de completar este capítulo, você deve ser capaz de:

```bash
azd version              # Mostra a versão instalada
azd init --template todo-nodejs-mongo  # Inicializa o projeto
azd up                   # Implanta no Azure
azd show                 # Exibe URL do aplicativo em execução
azd down --force --purge # Limpa os recursos
```

---

## 🔗 Navegação

| Direção | Capítulo |
|-----------|---------|
| **Próximo** | [Capítulo 2: Desenvolvimento AI-First](../chapter-02-ai-development/README.md) |
| **Pular para** | [Capítulo 3: Configuração](../chapter-03-configuration/README.md) |

---

## 📖 Recursos Relacionados

- [Resumo de Comandos](../../resources/cheat-sheet.md)
- [Perguntas Frequentes](../../resources/faq.md)
- [Glossário](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->