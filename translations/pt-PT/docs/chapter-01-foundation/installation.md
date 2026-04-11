# Guia de Instalação e Configuração

**Navegação do Capítulo:**
- **📚 Início do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 1 - Fundação & Início Rápido
- **⬅️ Anterior**: [Noções Básicas do AZD](azd-basics.md)
- **➡️ Seguinte**: [O Seu Primeiro Projeto](first-project.md)
- **🚀 Próximo Capítulo**: [Capítulo 2: Desenvolvimento AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introdução

Este guia abrangente irá guiá-lo na instalação e configuração do Azure Developer CLI (azd) no seu sistema. Aprenderá vários métodos de instalação para diferentes sistemas operativos, configuração de autenticação e configuração inicial para preparar o seu ambiente de desenvolvimento para deployments no Azure.

## Objetivos de Aprendizagem

No final desta lição, você irá:
- Instalar com sucesso o Azure Developer CLI no seu sistema operativo
- Configurar autenticação com o Azure usando vários métodos
- Configurar o seu ambiente de desenvolvimento com os pré-requisitos necessários
- Compreender as diferentes opções de instalação e quando usar cada uma
- Resolver problemas comuns de instalação e configuração

## Resultados de Aprendizagem

Após completar esta lição, você será capaz de:
- Instalar o azd usando o método apropriado para a sua plataforma
- Autenticar-se com o Azure usando o comando azd auth login
- Verificar a sua instalação e testar comandos básicos do azd
- Configurar o seu ambiente de desenvolvimento para uso otimizado do azd
- Resolver problemas comuns de instalação de forma autónoma

Este guia irá ajudá-lo a instalar e configurar o Azure Developer CLI no seu sistema, independentemente do seu sistema operativo ou ambiente de desenvolvimento.

## Pré-requisitos

Antes de instalar o azd, certifique-se que tem:
- **Assinatura Azure** - [Crie uma conta gratuita](https://azure.microsoft.com/free/)
- **Azure CLI** - Para autenticação e gestão de recursos
- **Git** - Para clonar templates e controlo de versões
- **Docker** (opcional) - Para aplicações em containers

## Métodos de Instalação

### Windows

#### Opção 1: Gestor de Pacotes Windows (Recomendado)
```cmd
winget install microsoft.azd
```

#### Opção 2: Script de Instalação PowerShell
```powershell
# Útil quando o winget não está disponível
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Opção 3: Chocolatey
```cmd
choco install azd
```

#### Opção 4: Instalação Manual
1. Faça o download da versão mais recente em [GitHub](https://github.com/Azure/azure-dev/releases)
2. Extraia para `C:\Program Files\azd\`
3. Adicione à variável de ambiente PATH

### macOS

#### Opção 1: Homebrew (Recomendado)
```bash
brew tap azure/azd
brew install azd
```

#### Opção 2: Script de Instalação
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opção 3: Instalação Manual
```bash
# Descarregar e instalar
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Opção 1: Script de Instalação (Recomendado)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opção 2: Gestores de Pacotes

**Instalação manual a partir dos assets da release:**
```bash
# Descarregue o arquivo mais recente para a sua arquitetura Linux em:
# https://github.com/Azure/azure-dev/releases
# Depois, extraia-o e adicione o binário azd ao seu PATH.
```

### GitHub Codespaces

Alguns Codespaces e ambientes de contêiner de desenvolvimento já incluem o `azd`, mas deve verificar isso em vez de assumir:

```bash
azd version
```

Se o `azd` estiver em falta, instale-o com o script padrão para o ambiente.

### Docker

```bash
# Execute azd num contentor
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Crie um alias para uso mais fácil
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Verificar Instalação

Após a instalação, verifique se o azd está a funcionar corretamente:

```bash
# Verificar versão
azd version

# Ver ajuda
azd --help

# Listar modelos disponíveis
azd template list
```

Saída esperada:
```
azd version 1.x.x (commit xxxxxx)
```

**Nota**: O número da versão real poderá variar. Consulte [Lançamentos do Azure Developer CLI](https://github.com/Azure/azure-dev/releases) para a versão mais recente.

**✅ Lista de Verificação de Instalação Bem-Sucedida:**
- [ ] `azd version` mostra o número da versão sem erros
- [ ] `azd --help` exibe a documentação dos comandos
- [ ] `azd template list` mostra os templates disponíveis
- [ ] Pode criar um diretório de teste e executar com sucesso `azd init`

**Se todas as verificações forem bem-sucedidas, está pronto para avançar para [O Seu Primeiro Projeto](first-project.md)!**

## Configuração de Autenticação

### Configuração Inicial Recomendada para Iniciantes

Para fluxos de trabalho centrados no AZD, inicie sessão com `azd auth login`.

```bash
# Necessário para comandos AZD como azd up
azd auth login

# Verificar o estado de autenticação do AZD
azd auth login --check-status
```

Use o login do Azure CLI apenas quando pretender executar comandos `az` durante o curso.

### Autenticação com Azure CLI (Opcional)
```bash
# Instalar Azure CLI se ainda não estiver instalado
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: consulte a documentação de instalação do Azure CLI para a sua distribuição

# Iniciar sessão no Azure
az login

# Verificar autenticação
az account show
```

### Qual Método de Login Deve Usar?

- Use `azd auth login` se estiver a seguir o caminho iniciante do AZD e utilizar principalmente comandos `azd`.
- Use também `az login` quando quiser executar comandos Azure CLI, como `az account show` ou inspecionar recursos diretamente.
- Se um exercício incluir comandos `azd` e `az`, execute ambos os comandos de login uma vez no início.

### Autenticação por Código do Dispositivo
Se estiver num sistema sem interface gráfica ou com problemas no navegador:
```bash
azd auth login --use-device-code
```

### Princípio de Serviço (CI/CD)
Para ambientes automatizados:
```bash
azd auth login \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --tenant-id <tenant-id>
```

### Valide a Sua Configuração Completa

Se quiser uma verificação rápida da prontidão antes de começar o Capítulo 1:

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
# Definir subscrição predefinida
azd config set defaults.subscription <subscription-id>

# Definir localização predefinida
azd config set defaults.location eastus2

# Ver toda a configuração
azd config show
```

### Variáveis de Ambiente
Adicione ao seu perfil de shell (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Configuração do Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Configuração azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Ativar registo de depuração
```

## Integração com IDE

### Visual Studio Code
Instale a extensão Azure Developer CLI:
1. Abra o VS Code
2. Vá a Extensões (Ctrl+Shift+X)
3. Pesquise por "Azure Developer CLI"
4. Instale a extensão

Funcionalidades:
- IntelliSense para azure.yaml
- Comandos no terminal integrado
- Navegação de templates
- Monitorização de deployments

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
1. Instale o plugin Azure
2. Configure as credenciais Azure
3. Use o terminal integrado para comandos azd

## 🐛 Resolução de Problemas de Instalação

### Problemas Comuns

#### Permissão Negada (Windows)
```powershell
# Executar PowerShell como Administrador
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Problemas com PATH
Adicione manualmente o azd à sua PATH:

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

# Pular verificação SSL (não recomendado para produção)
azd config set http.insecure true
```

#### Conflitos de Versão
```bash
# Remover instalações antigas
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: remover o binário azd anterior ou o link simbólico antes de reinstalar

# Limpar configuração
rm -rf ~/.azd
```

### Obter Mais Ajuda
```bash
# Ativar registo de depuração
export AZD_DEBUG=true
azd <command> --debug

# Ver configuração atual
azd config show

# Ver estado atual do deploiamento
azd show
```

## Atualizar azd

### Verificação de Atualização
O azd avisa quando há uma nova versão disponível, e pode confirmar a sua build atual com:
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
<summary><strong>Qual é a diferença entre azd e az CLI?</strong></summary>

**Azure CLI (az)**: Ferramenta de baixo nível para gerir recursos individuais do Azure
- `az webapp create`, `az storage account create`
- Um recurso de cada vez
- Foco na gestão da infraestrutura

**Azure Developer CLI (azd)**: Ferramenta de alto nível para deployments completos de aplicações
- `azd up` implanta toda a aplicação com todos os recursos
- Workflows baseados em templates
- Foco na produtividade do programador

**Precisa de ambos**: o azd usa o az CLI para autenticação
</details>

<details>
<summary><strong>Posso usar o azd com recursos Azure existentes?</strong></summary>

Sim! Pode:
1. Importar recursos existentes para os ambientes azd
2. Referenciar recursos existentes nos seus templates Bicep
3. Usar o azd para novos deployments em paralelo com a infraestrutura existente

Veja o [Guia de Configuração](configuration.md) para mais detalhes.
</details>

<details>
<summary><strong>O azd funciona com Azure Government ou Azure China?</strong></summary>

Sim, configure a cloud:
```bash
# Governo Azure
az cloud set --name AzureUSGovernment
az login

# Azure China
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Posso usar o azd em pipelines CI/CD?</strong></summary>

Absolutamente! O azd é desenhado para automação:
- Integração com GitHub Actions
- Suporte Azure DevOps
- Autenticação por princípio de serviço
- Modo não interativo

Veja o [Guia de Deployment](../chapter-04-infrastructure/deployment-guide.md) para padrões CI/CD.
</details>

<details>
<summary><strong>Qual o custo de usar o azd?</strong></summary>

O azd em si é **completamente gratuito** e open-source. Só paga por:
- Recursos Azure que implantar
- Custos de consumo Azure (computação, armazenamento, etc.)

Use `azd provision --preview` para estimar custos antes do deployment.
</details>

## Próximos Passos

1. **Complete a autenticação**: Certifique-se que pode aceder à sua assinatura Azure
2. **Experimente o seu primeiro deployment**: Siga o [Guia do Primeiro Projeto](first-project.md)
3. **Explore templates**: Navegue pelos templates disponíveis com `azd template list`
4. **Configure o seu IDE**: Prepare o seu ambiente de desenvolvimento

## Suporte

Se encontrar problemas:
- [Documentação Oficial](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Reportar Problemas](https://github.com/Azure/azure-dev/issues)
- [Discussões da Comunidade](https://github.com/Azure/azure-dev/discussions)
- [Suporte Azure](https://azure.microsoft.com/support/)
- [**Skills do Azure Agent**](https://skills.sh/microsoft/github-copilot-for-azure) - Obtenha orientação de comandos Azure diretamente no seu editor com `npx skills add microsoft/github-copilot-for-azure`

---

**Navegação do Capítulo:**
- **📚 Início do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 1 - Fundação & Início Rápido
- **⬅️ Anterior**: [Noções Básicas do AZD](azd-basics.md) 
- **➡️ Seguinte**: [O Seu Primeiro Projeto](first-project.md)
- **🚀 Próximo Capítulo**: [Capítulo 2: Desenvolvimento AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Instalação Concluída!** Continue para [O Seu Primeiro Projeto](first-project.md) para começar a construir com azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, note que as traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se a tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações erradas decorrentes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->