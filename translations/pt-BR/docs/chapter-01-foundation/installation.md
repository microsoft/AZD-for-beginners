# Guia de Instalação e Configuração

**Navegação do Capítulo:**
- **📚 Página do Curso**: [AZD para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 1 - Fundamentos & Início Rápido
- **⬅️ Anterior**: [Noções Básicas do AZD](azd-basics.md)
- **➡️ Próximo**: [Seu Primeiro Projeto](first-project.md)
- **🚀 Próximo Capítulo**: [Capítulo 2: Desenvolvimento com Foco em IA](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introdução

Este guia abrangente irá guiá-lo na instalação e configuração do Azure Developer CLI (azd) em seu sistema. Você aprenderá vários métodos de instalação para diferentes sistemas operacionais, configuração de autenticação e configuração inicial para preparar seu ambiente de desenvolvimento para implantações no Azure.

## Objetivos de Aprendizagem

Ao final desta lição, você irá:
- Instalar com sucesso o Azure Developer CLI no seu sistema operacional
- Configurar a autenticação com o Azure usando múltiplos métodos
- Preparar seu ambiente de desenvolvimento com os pré-requisitos necessários
- Entender as diferentes opções de instalação e quando usar cada uma
- Solucionar problemas comuns de instalação e configuração

## Resultados de Aprendizagem

Após concluir esta lição, você será capaz de:
- Instalar o azd usando o método apropriado para sua plataforma
- Autenticar-se no Azure usando azd auth login
- Verificar sua instalação e testar comandos básicos do azd
- Configurar seu ambiente de desenvolvimento para uso otimizado do azd
- Resolver problemas comuns de instalação de forma independente

Este guia ajudará você a instalar e configurar o Azure Developer CLI em seu sistema, independentemente do seu sistema operacional ou ambiente de desenvolvimento.

## Pré-requisitos

Antes de instalar o azd, certifique-se de ter:
- **Assinatura do Azure** - [Crie uma conta gratuita](https://azure.microsoft.com/free/)
- **Azure CLI** - Para autenticação e gerenciamento de recursos
- **Git** - Para clonar templates e controle de versão
- **Docker** (opcional) - Para aplicações conteinerizadas

## Métodos de Instalação

### Windows

#### Opção 1: Windows Package Manager (Recomendado)
```cmd
winget install microsoft.azd
```

#### Opção 2: PowerShell Install Script
```powershell
# Útil quando o winget não está disponível
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Opção 3: Chocolatey
```cmd
choco install azd
```

#### Opção 4: Instalação Manual
1. Baixe a versão mais recente de [GitHub](https://github.com/Azure/azure-dev/releases)
2. Extraia para `C:\Program Files\azd\`
3. Adicione à variável de ambiente PATH

### macOS

#### Opção 1: Homebrew (Recomendado)
```bash
brew tap azure/azd
brew install azd
```

#### Opção 2: Install Script
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opção 3: Instalação Manual
```bash
# Baixe e instale
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Opção 1: Install Script (Recomendado)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opção 2: Package Managers

**Instalação manual a partir dos assets de release:**
```bash
# Baixe o arquivo mais recente para sua arquitetura Linux em:
# https://github.com/Azure/azure-dev/releases
# Em seguida, extraia-o e adicione o binário azd ao seu PATH.
```

### GitHub Codespaces

Alguns Codespaces e ambientes de dev container já incluem `azd`, mas você deve verificar isso em vez de presumir:

```bash
azd version
```

Se `azd` estiver ausente, instale-o com o script padrão para o ambiente.

### Docker

```bash
# Execute o azd em um contêiner
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Crie um alias para facilitar o uso
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Verificar Instalação

Após a instalação, verifique se o azd está funcionando corretamente:

```bash
# Verificar versão
azd version

# Exibir ajuda
azd --help

# Listar modelos disponíveis
azd template list
```

Saída esperada:
```
azd version 1.x.x (commit xxxxxx)
```

**Observação**: O número da versão real pode variar. Verifique as [versões do Azure Developer CLI](https://github.com/Azure/azure-dev/releases) para a versão mais recente.

**✅ Lista de Verificação de Instalação Bem-sucedida:**
- [ ] `azd version` exibe o número da versão sem erros
- [ ] `azd --help` exibe a documentação de comandos
- [ ] `azd template list` mostra templates disponíveis
- [ ] Você pode criar um diretório de teste e executar `azd init` com sucesso

**Se todas as verificações passarem, você está pronto para prosseguir para [Seu Primeiro Projeto](first-project.md)!**

## Configuração de Autenticação

### Configuração Recomendada para Iniciantes

Para fluxos de trabalho com foco em AZD, faça login com `azd auth login`.

```bash
# Necessário para comandos do AZD, como azd up
azd auth login

# Verificar o status de autenticação do AZD
azd auth login --check-status
```

Use o login do Azure CLI somente quando você planeja executar comandos `az` por conta própria durante o curso.

### Autenticação com Azure CLI (Opcional)
```bash
# Instale o Azure CLI se ainda não estiver instalado
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: veja a documentação de instalação do Azure CLI para sua distribuição

# Faça login no Azure
az login

# Verifique a autenticação
az account show
```

### Qual Fluxo de Login Você Deve Usar?

- Use `azd auth login` se você estiver seguindo a trilha iniciante do AZD e principalmente executando comandos `azd`.
- Use `az login` também quando quiser executar comandos do Azure CLI, como `az account show`, ou inspecionar recursos diretamente.
- Se um exercício incluir tanto comandos `azd` quanto `az`, execute ambos os comandos de login uma vez no início.

### Autenticação por Device Code
Se você estiver em um sistema sem interface gráfica ou com problemas no navegador:
```bash
azd auth login --use-device-code
```

### Principal de Serviço (CI/CD)
Para ambientes automatizados:
```bash
azd auth login \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --tenant-id <tenant-id>
```

### Valide Sua Configuração Completa

Se quiser uma verificação rápida de prontidão antes de começar o Capítulo 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## Configuração

### Configuração Global
```bash
# Definir assinatura padrão
azd config set defaults.subscription <subscription-id>

# Definir localização padrão
azd config set defaults.location eastus2

# Ver todas as configurações
azd config show
```

### Variáveis de Ambiente
Adicione ao seu perfil de shell (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Configuração do Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Configuração do azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Ativar registro de depuração
```

## Integração com IDE

### Visual Studio Code
Instale a extensão Azure Developer CLI:
1. Abra o VS Code
2. Vá para Extensões (Ctrl+Shift+X)
3. Pesquise por "Azure Developer CLI"
4. Instale a extensão

Recursos:
- IntelliSense para azure.yaml
- Comandos integrados no terminal
- Navegação de templates
- Monitoramento de implantações

### GitHub Codespaces
Crie um `.devcontainer/devcontainer.json`:
```json
{
  "name": "Azure Developer CLI",
  "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
  "features": {
    "ghcr.io/azure/azure-dev/azd:latest": {}
  },
  "postCreateCommand": "azd version"
}
```

### IntelliJ/JetBrains
1. Instale o plugin do Azure
2. Configure as credenciais do Azure
3. Use o terminal integrado para comandos azd

## 🐛 Solução de Problemas na Instalação

### Problemas Comuns

#### Permissão Negada (Windows)
```powershell
# Execute o PowerShell como administrador
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Problemas com o PATH
Adicione manualmente o azd ao seu PATH:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Problemas de Rede/Proxy
```bash
# Configurar proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Ignorar verificação SSL (não recomendado para produção)
azd config set http.insecure true
```

#### Conflitos de Versão
```bash
# Remover instalações antigas
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: remova o binário azd anterior ou o link simbólico antes de reinstalar

# Limpar configuração
rm -rf ~/.azd
```

### Obter Mais Ajuda
```bash
# Ativar logs de depuração
export AZD_DEBUG=true
azd <command> --debug

# Ver configuração atual
azd config show

# Ver status atual da implantação
azd show
```

## Atualizando o azd

### Verificação de Atualização
O azd avisa quando uma nova versão está disponível, e você pode confirmar sua build atual com:
```bash
azd version
```

### Atualizações Manuais

**Windows (winget):**
```cmd
winget upgrade microsoft.azd
```

**macOS (Homebrew):**
```bash
brew upgrade azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

## 💡 Perguntas Frequentes

<details>
<summary><strong>Qual a diferença entre azd e az CLI?</strong></summary>

**Azure CLI (az)**: Ferramenta de baixo nível para gerenciar recursos individuais do Azure
- `az webapp create`, `az storage account create`
- Um recurso por vez
- Foco em gerenciamento de infraestrutura

**Azure Developer CLI (azd)**: Ferramenta de alto nível para implantações completas de aplicações
- `azd up` implanta o aplicativo inteiro com todos os recursos
- Fluxos de trabalho baseados em templates
- Foco na produtividade do desenvolvedor

**Você precisa de ambos**: azd usa o az CLI para autenticação
</details>

<details>
<summary><strong>Posso usar azd com recursos existentes do Azure?</strong></summary>

Sim! Você pode:
1. Importar recursos existentes para ambientes azd
2. Referenciar recursos existentes em seus templates Bicep
3. Usar azd para novas implantações ao lado da infraestrutura existente

Veja o [Guia de Configuração](configuration.md) para detalhes.
</details>

<details>
<summary><strong>O azd funciona com Azure Government ou Azure China?</strong></summary>

Sim, configure a nuvem:
```bash
# Azure do Governo
az cloud set --name AzureUSGovernment
az login

# Azure China
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Posso usar azd em pipelines de CI/CD?</strong></summary>

Com certeza! O azd foi projetado para automação:
- Integração com GitHub Actions
- Suporte ao Azure DevOps
- Autenticação por principal de serviço
- Modo não interativo

Veja o [Guia de Implantação](../chapter-04-infrastructure/deployment-guide.md) para padrões de CI/CD.
</details>

<details>
<summary><strong>Qual é o custo de usar o azd?</strong></summary>

O azd em si é **completamente gratuito** e de código aberto. Você só paga por:
- Recursos do Azure que você implantar
- Custos de consumo do Azure (compute, armazenamento, etc.)

Use `azd provision --preview` para estimar custos antes da implantação.
</details>

## Próximos Passos

1. **Concluir a autenticação**: Garanta que você pode acessar sua assinatura do Azure
2. **Experimente sua primeira implantação**: Siga o [Guia do Primeiro Projeto](first-project.md)
3. **Explore templates**: Navegue pelos templates disponíveis com `azd template list`
4. **Configure sua IDE**: Prepare seu ambiente de desenvolvimento

## Suporte

Se você encontrar problemas:
- [Documentação Oficial](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Reportar Problemas](https://github.com/Azure/azure-dev/issues)
- [Discussões da Comunidade](https://github.com/Azure/azure-dev/discussions)
- [Suporte do Azure](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Obtenha orientação de comandos do Azure diretamente no seu editor com `npx skills add microsoft/github-copilot-for-azure`

---

**Navegação do Capítulo:**
- **📚 Página do Curso**: [AZD para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 1 - Fundamentos & Início Rápido
- **⬅️ Anterior**: [Noções Básicas do AZD](azd-basics.md) 
- **➡️ Próximo**: [Seu Primeiro Projeto](first-project.md)
- **🚀 Próximo Capítulo**: [Capítulo 2: Desenvolvimento com Foco em IA](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Instalação Concluída!** Continue para [Seu Primeiro Projeto](first-project.md) para começar a construir com o azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Isenção de responsabilidade**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se tradução profissional feita por tradutores humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->