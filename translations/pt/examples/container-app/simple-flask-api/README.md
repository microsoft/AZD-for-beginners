<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9e7f581a238c1bf7f9f31a2ba118a90c",
  "translation_date": "2025-11-19T21:02:19+00:00",
  "source_file": "examples/container-app/simple-flask-api/README.md",
  "language_code": "pt"
}
-->
# API Simples com Flask - Exemplo de Aplicação em Contêiner

**Caminho de Aprendizagem:** Iniciante ⭐ | **Tempo:** 25-35 minutos | **Custo:** $0-15/mês

Um API REST completo e funcional em Python Flask, implantado no Azure Container Apps usando Azure Developer CLI (azd). Este exemplo demonstra implantação de contêiner, autoescalonamento e conceitos básicos de monitorização.

## 🎯 O Que Vai Aprender

- Implantar uma aplicação Python em contêiner no Azure
- Configurar autoescalonamento com escala para zero
- Implementar sondas de saúde e verificações de prontidão
- Monitorizar logs e métricas da aplicação
- Usar Azure Developer CLI para implantação rápida

## 📦 O Que Está Incluído

✅ **Aplicação Flask** - API REST completa com operações CRUD (`src/app.py`)  
✅ **Dockerfile** - Configuração de contêiner pronta para produção  
✅ **Infraestrutura Bicep** - Ambiente de Container Apps e implantação da API  
✅ **Configuração AZD** - Configuração para implantação com um comando  
✅ **Sondas de Saúde** - Verificações de prontidão e saúde configuradas  
✅ **Autoescalonamento** - 0-10 réplicas com base na carga HTTP  

## Arquitetura

```
┌─────────────────────────────────────────┐
│   Azure Container Apps Environment      │
│                                         │
│  ┌───────────────────────────────────┐ │
│  │   Flask API Container             │ │
│  │   - Health endpoints              │ │
│  │   - REST API                      │ │
│  │   - Auto-scaling (0-10 replicas)  │ │
│  └───────────────────────────────────┘ │
│                                         │
│  Application Insights ────────────────┐ │
└────────────────────────────────────────┘
```

## Pré-requisitos

### Necessário
- **Azure Developer CLI (azd)** - [Guia de instalação](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Assinatura do Azure** - [Conta gratuita](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Instalar Docker](https://www.docker.com/products/docker-desktop/) (para testes locais)

### Verificar Pré-requisitos

```bash
# Verificar a versão do azd (necessário 1.5.0 ou superior)
azd version

# Verificar o login no Azure
azd auth login

# Verificar o Docker (opcional, para testes locais)
docker --version
```

## ⏱️ Cronograma de Implantação

| Fase | Duração | O Que Acontece |
|------|---------|----------------||
| Configuração do ambiente | 30 segundos | Criar ambiente azd |
| Construir contêiner | 2-3 minutos | Construção Docker da aplicação Flask |
| Provisionar infraestrutura | 3-5 minutos | Criar Container Apps, registro, monitorização |
| Implantar aplicação | 2-3 minutos | Enviar imagem e implantar no Container Apps |
| **Total** | **8-12 minutos** | Implantação completa pronta |

## Início Rápido

```bash
# Navegar para o exemplo
cd examples/container-app/simple-flask-api

# Inicializar o ambiente (escolher um nome único)
azd env new myflaskapi

# Implementar tudo (infraestrutura + aplicação)
azd up
# Ser-lhe-á solicitado para:
# 1. Selecionar a subscrição do Azure
# 2. Escolher a localização (por exemplo, eastus2)
# 3. Aguardar 8-12 minutos para a implementação

# Obter o endpoint da API
azd env get-values

# Testar a API
curl $(azd env get-value API_ENDPOINT)/health
```

**Saída Esperada:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ Verificar Implantação

### Passo 1: Verificar Status da Implantação

```bash
# Ver serviços implementados
azd show

# A saída esperada mostra:
# - Serviço: api
# - Endpoint: https://ca-api-[env].xxx.azurecontainerapps.io
# - Estado: Em execução
```

### Passo 2: Testar Endpoints da API

```bash
# Obter endpoint da API
API_URL=$(azd env get-value API_ENDPOINT)

# Testar saúde
curl $API_URL/health

# Testar endpoint raiz
curl $API_URL/

# Criar um item
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# Obter todos os itens
curl $API_URL/api/items
```

**Critérios de Sucesso:**
- ✅ Endpoint de saúde retorna HTTP 200
- ✅ Endpoint raiz mostra informações da API
- ✅ POST cria item e retorna HTTP 201
- ✅ GET retorna itens criados

### Passo 3: Visualizar Logs

```bash
# Transmitir logs ao vivo
azd logs api --follow

# Deverá ver:
# - Mensagens de inicialização do Gunicorn
# - Logs de pedidos HTTP
# - Logs de informações da aplicação
```

## Estrutura do Projeto

```
simple-flask-api/
├── azure.yaml              # AZD configuration
├── infra/
│   ├── main.bicep         # Main infrastructure
│   ├── main.parameters.json
│   └── app/
│       ├── container-env.bicep
│       └── api.bicep
└── src/
    ├── app.py             # Flask application
    ├── requirements.txt
    └── Dockerfile
```

## Endpoints da API

| Endpoint | Método | Descrição |
|----------|--------|-----------|
| `/health` | GET | Verificação de saúde |
| `/api/items` | GET | Listar todos os itens |
| `/api/items` | POST | Criar novo item |
| `/api/items/{id}` | GET | Obter item específico |
| `/api/items/{id}` | PUT | Atualizar item |
| `/api/items/{id}` | DELETE | Excluir item |

## Configuração

### Variáveis de Ambiente

```bash
# Definir configuração personalizada
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Configuração de Escalabilidade

A API escala automaticamente com base no tráfego HTTP:
- **Réplicas Mínimas**: 0 (escala para zero quando inativa)
- **Réplicas Máximas**: 10
- **Solicitações Simultâneas por Réplica**: 50

## Desenvolvimento

### Executar Localmente

```bash
# Instalar dependências
cd src
pip install -r requirements.txt

# Executar a aplicação
python app.py

# Testar localmente
curl http://localhost:8000/health
```

### Construir e Testar Contêiner

```bash
# Construir imagem Docker
docker build -t flask-api:local ./src

# Executar o contentor localmente
docker run -p 8000:8000 flask-api:local

# Testar o contentor
curl http://localhost:8000/health
```

## Implantação

### Implantação Completa

```bash
# Implementar infraestrutura e aplicação
azd up
```

### Implantação Apenas de Código

```bash
# Implementar apenas o código da aplicação (infraestrutura inalterada)
azd deploy api
```

### Atualizar Configuração

```bash
# Atualizar variáveis de ambiente
azd env set API_KEY "new-api-key"

# Reimplementar com nova configuração
azd deploy api
```

## Monitorização

### Visualizar Logs

```bash
# Transmitir logs ao vivo
azd logs api --follow

# Ver as últimas 100 linhas
azd logs api --tail 100
```

### Monitorizar Métricas

```bash
# Abrir o painel do Azure Monitor
azd monitor --overview

# Ver métricas específicas
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## Testes

### Verificação de Saúde

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

Resposta esperada:
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### Criar Item

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### Obter Todos os Itens

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## Otimização de Custos

Esta implantação usa escala para zero, então só paga quando a API está processando solicitações:

- **Custo inativo**: ~$0/mês (escalado para zero)
- **Custo ativo**: ~$0.000024/segundo por réplica
- **Custo mensal esperado** (uso leve): $5-15

### Reduzir Custos Ainda Mais

```bash
# Reduzir o número máximo de réplicas para desenvolvimento
azd env set MAX_REPLICAS 3

# Usar um tempo limite de inatividade mais curto
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 minutos
```

## Resolução de Problemas

### Contêiner Não Inicia

```bash
# Verificar os logs do contentor
azd logs api --tail 100

# Verificar se as imagens Docker são construídas localmente
docker build -t test ./src
```

### API Não Está Acessível

```bash
# Verificar se o ingresso é externo
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Altos Tempos de Resposta

```bash
# Verificar o uso de CPU/Memória
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Aumentar os recursos, se necessário
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## Limpeza

```bash
# Eliminar todos os recursos
azd down --force --purge
```

## Próximos Passos

### Expandir Este Exemplo

1. **Adicionar Base de Dados** - Integrar Azure Cosmos DB ou SQL Database
   ```bash
   # Adicionar módulo Cosmos DB ao infra/main.bicep
   # Atualizar app.py com a ligação à base de dados
   ```

2. **Adicionar Autenticação** - Implementar Azure AD ou chaves de API
   ```python
   # Adicionar middleware de autenticação ao app.py
   from functools import wraps
   ```

3. **Configurar CI/CD** - Workflow com GitHub Actions
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Adicionar Identidade Gerida** - Acesso seguro a serviços do Azure
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### Exemplos Relacionados

- **[Aplicação com Base de Dados](../../../../../examples/database-app)** - Exemplo completo com SQL Database
- **[Microserviços](../../../../../examples/container-app/microservices)** - Arquitetura de múltiplos serviços
- **[Guia Mestre de Container Apps](../README.md)** - Todos os padrões de contêiner

### Recursos de Aprendizagem

- 📚 [Curso AZD para Iniciantes](../../../README.md) - Página principal do curso
- 📚 [Padrões de Container Apps](../README.md) - Mais padrões de implantação
- 📚 [Galeria de Templates AZD](https://azure.github.io/awesome-azd/) - Templates da comunidade

## Recursos Adicionais

### Documentação
- **[Documentação Flask](https://flask.palletsprojects.com/)** - Guia do framework Flask
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Documentação oficial do Azure
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - Referência de comandos azd

### Tutoriais
- **[Introdução ao Container Apps](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Implante sua primeira aplicação
- **[Python no Azure](https://learn.microsoft.com/azure/developer/python/)** - Guia de desenvolvimento em Python
- **[Linguagem Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infraestrutura como código

### Ferramentas
- **[Portal Azure](https://portal.azure.com)** - Gerir recursos visualmente
- **[Extensão Azure para VS Code](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - Integração com IDE

---

**🎉 Parabéns!** Você implantou um API Flask pronto para produção no Azure Container Apps com autoescalonamento e monitorização.

**Dúvidas?** [Abra uma issue](https://github.com/microsoft/AZD-for-beginners/issues) ou consulte o [FAQ](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original no seu idioma nativo deve ser considerado a fonte autoritária. Para informações críticas, recomenda-se uma tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->