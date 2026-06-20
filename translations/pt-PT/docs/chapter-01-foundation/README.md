# Capítulo 1: Fundação & Início Rápido

**📚 Curso**: [AZD Para Iniciantes](../../README.md) | **⏱️ Duração**: 30-45 minutos | **⭐ Complexidade**: Iniciante

---

## Visão Geral

Este capítulo introduz os fundamentos do Azure Developer CLI (azd). Vai aprender conceitos principais, instalar as ferramentas e implantar a sua primeira aplicação no Azure.

> Validado com `azd 1.25.6` em junho de 2026.

## Objetivos de Aprendizagem

Ao completar este capítulo, irá:
- Compreender o que é o Azure Developer CLI e como difere do Azure CLI
- Instalar e configurar o AZD na sua plataforma
- Implantar a sua primeira aplicação no Azure com `azd up`
- Limpar os recursos com `azd down`

---

## 📚 Lições

| # | Lição | Descrição | Tempo |
|---|--------|-------------|-------|
| 1 | [Noções Básicas do AZD](azd-basics.md) | Conceitos principais, terminologia e estrutura do projeto | 15 min |
| 2 | [Instalação & Configuração](installation.md) | Guias de instalação específicos para cada plataforma | 10 min |
| 3 | [O Seu Primeiro Projeto](first-project.md) | Prático: Implantar uma aplicação web no Azure | 20 min |
| 4 | [Traga a Sua Própria App](bring-your-own-app.md) | Adicione azd a um projeto existente que já tenha | 15 min |
| 5 | [Contentores de Desenvolvimento & Codespaces](dev-containers.md) | Ambientes azd reprodutíveis com contentores de desenvolvimento | 15 min |

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

Se o script indicar ferramentas em falta, corrija-as primeiro e depois continue com o capítulo.

---

## 🚀 Início Rápido

```bash
# Verificar instalação
azd version

# Autenticar para AZD
# Opcional: az login se pretender executar comandos Azure CLI diretamente
azd auth login

# Desplegar a sua primeira aplicação
azd init --template todo-nodejs-mongo
azd up

# Limpar quando terminar
azd down --force --purge
```

---

## ✅ Critérios de Sucesso

Após completar este capítulo, deverá ser capaz de:

```bash
azd version              # Mostra a versão instalada
azd init --template todo-nodejs-mongo  # Inicializa o projeto
azd up                   # Implementa no Azure
azd show                 # Exibe a URL da aplicação em execução
azd down --force --purge # Limpa os recursos
```

---

## 🔗 Navegação

| Direção | Capítulo |
|---------|----------|
| **Seguinte** | [Capítulo 2: Desenvolvimento com IA em Primeiro Lugar](../chapter-02-ai-development/README.md) |
| **Saltar para** | [Capítulo 3: Configuração](../chapter-03-configuration/README.md) |

---

## 📖 Recursos Relacionados

- [Folha de Comandos](../../resources/cheat-sheet.md)
- [Perguntas Frequentes](../../resources/faq.md)
- [Glossário](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->