# Implementação de uma Base de Dados Microsoft SQL e Aplicação Web com AZD

⏱️ **Tempo Estimado**: 20-30 minutos | 💰 **Custo Estimado**: ~15-25€/mês | ⭐ **Complexidade**: Intermédia

Este **exemplo completo e funcional** demonstra como usar o [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) para implementar uma aplicação web Python Flask com uma Base de Dados Microsoft SQL no Azure. Todo o código está incluído e testado—não são necessárias dependências externas.

## O que irá aprender

Ao concluir este exemplo, irá:
- Implementar uma aplicação multi-camadas (aplicação web + base de dados) usando infraestrutura como código
- Configurar conexões seguras à base de dados sem codificar segredos
- Monitorizar a saúde da aplicação com Application Insights
- Gerir recursos do Azure de forma eficiente com AZD CLI
- Seguir as melhores práticas do Azure para segurança, otimização de custos e observabilidade

## Visão Geral do Cenário
- **Aplicação Web**: API REST Python Flask com conectividade à base de dados
- **Base de Dados**: Base de Dados Azure SQL com dados de exemplo
- **Infraestrutura**: Provisionada usando Bicep (templates modulares e reutilizáveis)
- **Implementação**: Totalmente automatizada com comandos `azd`
- **Monitorização**: Application Insights para registos e telemetria

## Pré-requisitos

### Ferramentas Necessárias

Antes de começar, verifique se tem estas ferramentas instaladas:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (versão 2.50.0 ou superior)
   ```sh
   az --version
   # Saída esperada: azure-cli 2.50.0 ou superior
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (versão 1.0.0 ou superior)
   ```sh
   azd version
   # Saída esperada: versão azd 1.0.0 ou superior
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (para desenvolvimento local)
   ```sh
   python --version
   # Saída esperada: Python 3.8 ou superior
   ```

4. **[Docker](https://www.docker.com/get-started)** (opcional, para desenvolvimento local em contêineres)
   ```sh
   docker --version
   # Saída esperada: versão do Docker 20.10 ou superior
   ```

### Requisitos do Azure

- Uma **subscrição Azure** ativa ([crie uma conta gratuita](https://azure.microsoft.com/free/))
- Permissões para criar recursos na sua subscrição
- Função de **Proprietário** ou **Contribuidor** na subscrição ou grupo de recursos

### Conhecimentos Necessários

Este é um exemplo de **nível intermédio**. Deve estar familiarizado com:
- Operações básicas na linha de comandos
- Conceitos fundamentais de cloud (recursos, grupos de recursos)
- Compreensão básica de aplicações web e bases de dados

**Novo no AZD?** Comece com o [guia de introdução](../../docs/getting-started/azd-basics.md).

## Arquitetura

Este exemplo implementa uma arquitetura de duas camadas com uma aplicação web e uma base de dados SQL:

```
┌─────────────────┐        ┌──────────────────────┐
│  User Browser   │◄──────►│   Azure Web App      │
└─────────────────┘        │   (Flask API)        │
                           │   - /health          │
                           │   - /products        │
                           └──────────┬───────────┘
                                      │
                                      │ Secure Connection
                                      │ (Encrypted)
                                      │
                           ┌──────────▼───────────┐
                           │ Azure SQL Database   │
                           │   - Products table   │
                           │   - Sample data      │
                           └──────────────────────┘
```

**Implementação de Recursos:**
- **Grupo de Recursos**: Contém todos os recursos
- **Plano de Serviço de Aplicação**: Hospedagem baseada em Linux (nível B1 para eficiência de custos)
- **Aplicação Web**: Runtime Python 3.11 com aplicação Flask
- **Servidor SQL**: Servidor de base de dados gerido com TLS 1.2 mínimo
- **Base de Dados SQL**: Nível básico (2GB, adequado para desenvolvimento/testes)
- **Application Insights**: Monitorização e registos
- **Log Analytics Workspace**: Armazenamento centralizado de registos

**Analogia**: Pense nisto como um restaurante (aplicação web) com um congelador (base de dados). Os clientes fazem pedidos do menu (endpoints da API), e a cozinha (aplicação Flask) obtém os ingredientes (dados) do congelador. O gerente do restaurante (Application Insights) acompanha tudo o que acontece.

## Estrutura de Pastas

Todos os ficheiros estão incluídos neste exemplo—não são necessárias dependências externas:

```
examples/database-app/
│
├── README.md                    # This file
├── azure.yaml                   # AZD configuration file
├── .env.sample                  # Sample environment variables
├── .gitignore                   # Git ignore patterns
│
├── infra/                       # Infrastructure as Code (Bicep)
│   ├── main.bicep              # Main orchestration template
│   ├── abbreviations.json      # Azure naming conventions
│   └── resources/              # Modular resource templates
│       ├── sql-server.bicep    # SQL Server configuration
│       ├── sql-database.bicep  # Database configuration
│       ├── app-service-plan.bicep  # Hosting plan
│       ├── app-insights.bicep  # Monitoring setup
│       └── web-app.bicep       # Web application
│
└── src/
    └── web/                    # Application source code
        ├── app.py              # Flask REST API
        ├── requirements.txt    # Python dependencies
        └── Dockerfile          # Container definition
```

**O que cada ficheiro faz:**
- **azure.yaml**: Indica ao AZD o que implementar e onde
- **infra/main.bicep**: Orquestra todos os recursos do Azure
- **infra/resources/*.bicep**: Definições individuais de recursos (modulares para reutilização)
- **src/web/app.py**: Aplicação Flask com lógica de base de dados
- **requirements.txt**: Dependências de pacotes Python
- **Dockerfile**: Instruções de containerização para implementação

## Início Rápido (Passo-a-Passo)

### Passo 1: Clonar e Navegar

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Verificação de Sucesso**: Verifique se vê `azure.yaml` e a pasta `infra/`:
```sh
ls
# Esperado: README.md, azure.yaml, infra/, src/
```

### Passo 2: Autenticar com o Azure

```sh
azd auth login
```

Isto abrirá o seu navegador para autenticação no Azure. Inicie sessão com as suas credenciais do Azure.

**✓ Verificação de Sucesso**: Deve ver:
```
Logged in to Azure.
```

### Passo 3: Inicializar o Ambiente

```sh
azd init
```

**O que acontece**: O AZD cria uma configuração local para a sua implementação.

**Perguntas que verá**:
- **Nome do ambiente**: Insira um nome curto (ex.: `dev`, `myapp`)
- **Subscrição Azure**: Selecione a sua subscrição da lista
- **Localização Azure**: Escolha uma região (ex.: `eastus`, `westeurope`)

**✓ Verificação de Sucesso**: Deve ver:
```
SUCCESS: New project initialized!
```

### Passo 4: Provisionar Recursos do Azure

```sh
azd provision
```

**O que acontece**: O AZD implementa toda a infraestrutura (leva 5-8 minutos):
1. Cria o grupo de recursos
2. Cria o Servidor SQL e a Base de Dados
3. Cria o Plano de Serviço de Aplicação
4. Cria a Aplicação Web
5. Cria o Application Insights
6. Configura rede e segurança

**Será solicitado**:
- **Nome de utilizador admin SQL**: Insira um nome de utilizador (ex.: `sqladmin`)
- **Palavra-passe admin SQL**: Insira uma palavra-passe forte (guarde isto!)

**✓ Verificação de Sucesso**: Deve ver:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Tempo**: 5-8 minutos

### Passo 5: Implementar a Aplicação

```sh
azd deploy
```

**O que acontece**: O AZD constrói e implementa a sua aplicação Flask:
1. Empacota a aplicação Python
2. Constrói o contêiner Docker
3. Envia para a Aplicação Web no Azure
4. Inicializa a base de dados com dados de exemplo
5. Inicia a aplicação

**✓ Verificação de Sucesso**: Deve ver:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Tempo**: 3-5 minutos

### Passo 6: Navegar na Aplicação

```sh
azd browse
```

Isto abrirá a sua aplicação web implementada no navegador em `https://app-<unique-id>.azurewebsites.net`

**✓ Verificação de Sucesso**: Deve ver saída JSON:
```json
{
  "message": "Welcome to the Database App API",
  "endpoints": {
    "/": "This help message",
    "/health": "Health check endpoint",
    "/products": "List all products",
    "/products/<id>": "Get product by ID"
  }
}
```

### Passo 7: Testar os Endpoints da API

**Verificação de Saúde** (verificar conexão à base de dados):
```sh
curl https://app-<your-id>.azurewebsites.net/health
```

**Resposta Esperada**:
```json
{
  "status": "healthy",
  "database": "connected"
}
```

**Listar Produtos** (dados de exemplo):
```sh
curl https://app-<your-id>.azurewebsites.net/products
```

**Resposta Esperada**:
```json
[
  {
    "id": 1,
    "name": "Laptop",
    "description": "High-performance laptop",
    "price": 1299.99,
    "created_at": "2025-11-19T10:30:00"
  },
  ...
]
```

**Obter Produto Único**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ Verificação de Sucesso**: Todos os endpoints retornam dados JSON sem erros.

---

**🎉 Parabéns!** Implementou com sucesso uma aplicação web com uma base de dados no Azure usando AZD.

## Análise Detalhada da Configuração

### Variáveis de Ambiente

Os segredos são geridos de forma segura através da configuração do Azure App Service—**nunca codificados no código fonte**.

**Configurado Automaticamente pelo AZD**:
- `SQL_CONNECTION_STRING`: Conexão à base de dados com credenciais encriptadas
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: Endpoint de telemetria de monitorização
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Permite instalação automática de dependências

**Onde os Segredos São Armazenados**:
1. Durante o `azd provision`, fornece credenciais SQL através de prompts seguros
2. O AZD armazena-os no ficheiro `.azure/<env-name>/.env` local (ignorado pelo Git)
3. O AZD injeta-os na configuração do Azure App Service (encriptados em repouso)
4. A aplicação lê-os através de `os.getenv()` em tempo de execução

### Desenvolvimento Local

Para testes locais, crie um ficheiro `.env` a partir do exemplo:

```sh
cp .env.sample .env
# Edite o .env com a sua conexão de base de dados local
```

**Fluxo de Trabalho de Desenvolvimento Local**:
```sh
# Instalar dependências
cd src/web
pip install -r requirements.txt

# Definir variáveis de ambiente
export SQL_CONNECTION_STRING="your-local-connection-string"

# Executar a aplicação
python app.py
```

**Testar localmente**:
```sh
curl http://localhost:8000/health
# Esperado: {"status": "saudável", "database": "conectado"}
```

### Infraestrutura como Código

Todos os recursos do Azure são definidos em **templates Bicep** (pasta `infra/`):

- **Design Modular**: Cada tipo de recurso tem o seu próprio ficheiro para reutilização
- **Parametrizado**: Personalize SKUs, regiões, convenções de nomenclatura
- **Melhores Práticas**: Segue padrões de nomenclatura e padrões de segurança do Azure
- **Controlado por Versão**: Alterações na infraestrutura são rastreadas no Git

**Exemplo de Personalização**:
Para alterar o nível da base de dados, edite `infra/resources/sql-database.bicep`:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## Melhores Práticas de Segurança

Este exemplo segue as melhores práticas de segurança do Azure:

### 1. **Sem Segredos no Código Fonte**
- ✅ Credenciais armazenadas na configuração do Azure App Service (encriptadas)
- ✅ Ficheiros `.env` excluídos do Git via `.gitignore`
- ✅ Segredos passados através de parâmetros seguros durante o provisionamento

### 2. **Conexões Encriptadas**
- ✅ TLS 1.2 mínimo para o Servidor SQL
- ✅ Apenas HTTPS ativado para a Aplicação Web
- ✅ Conexões à base de dados usam canais encriptados

### 3. **Segurança de Rede**
- ✅ Firewall do Servidor SQL configurado para permitir apenas serviços do Azure
- ✅ Acesso à rede pública restrito (pode ser ainda mais bloqueado com Endpoints Privados)
- ✅ FTPS desativado na Aplicação Web

### 4. **Autenticação e Autorização**
- ⚠️ **Atual**: Autenticação SQL (nome de utilizador/palavra-passe)
- ✅ **Recomendação para Produção**: Use Identidade Gerida do Azure para autenticação sem palavra-passe

**Para Atualizar para Identidade Gerida** (para produção):
1. Ative a identidade gerida na Aplicação Web
2. Conceda permissões SQL à identidade
3. Atualize a string de conexão para usar identidade gerida
4. Remova a autenticação baseada em palavra-passe

### 5. **Auditoria e Conformidade**
- ✅ Application Insights regista todas as solicitações e erros
- ✅ Auditoria da Base de Dados SQL ativada (pode ser configurada para conformidade)
- ✅ Todos os recursos etiquetados para governança

**Lista de Verificação de Segurança Antes da Produção**:
- [ ] Ativar Azure Defender para SQL
- [ ] Configurar Endpoints Privados para a Base de Dados SQL
- [ ] Ativar Firewall de Aplicação Web (WAF)
- [ ] Implementar Azure Key Vault para rotação de segredos
- [ ] Configurar autenticação Azure AD
- [ ] Ativar registos de diagnóstico para todos os recursos

## Otimização de Custos

**Custos Mensais Estimados** (a partir de novembro de 2025):

| Recurso | SKU/Nível | Custo Estimado |
|---------|-----------|----------------|
| Plano de Serviço de Aplicação | B1 (Básico) | ~13€/mês |
| Base de Dados SQL | Básico (2GB) | ~5€/mês |
| Application Insights | Pay-as-you-go | ~2€/mês (baixo tráfego) |
| **Total** | | **~20€/mês** |

**💡 Dicas para Reduzir Custos**:

1. **Use o Nível Gratuito para Aprendizagem**:
   - Serviço de Aplicação: Nível F1 (gratuito, horas limitadas)
   - Base de Dados SQL: Use Azure SQL Database serverless
   - Application Insights: 5GB/mês de ingestão gratuita

2. **Pare Recursos Quando Não Estiverem em Uso**:
   ```sh
   # Pare a aplicação web (a base de dados continua a cobrar)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # Reinicie quando necessário
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **Apague Tudo Após Testar**:
   ```sh
   azd down
   ```
   Isto remove TODOS os recursos e interrompe os custos.

4. **SKUs de Desenvolvimento vs. Produção**:
   - **Desenvolvimento**: Nível básico (usado neste exemplo)
   - **Produção**: Nível Standard/Premium com redundância

**Monitorização de Custos**:
- Veja os custos em [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- Configure alertas de custos para evitar surpresas
- Etiquete todos os recursos com `azd-env-name` para rastreamento

**Alternativa Gratuita**:
Para fins de aprendizagem, pode modificar `infra/resources/app-service-plan.bicep`:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Nota**: O nível gratuito tem limitações (60 min/dia de CPU, sem always-on).

## Monitorização e Observabilidade

### Integração com Application Insights

Este exemplo inclui **Application Insights** para monitorização abrangente:

**O que é Monitorizado**:
- ✅ Solicitações HTTP (latência, códigos de estado, endpoints)
- ✅ Erros e exceções da aplicação
- ✅ Registos personalizados da aplicação Flask
- ✅ Saúde da conexão à base de dados
- ✅ Métricas de desempenho (CPU, memória)

**Aceder ao Application Insights**:
1. Abra o [Portal Azure](https://portal.azure.com)
2. Navegue até ao seu grupo de recursos (`rg-<env-name>`)
3. Clique no recurso Application Insights (`appi-<unique-id>`)

**Consultas Úteis** (Application Insights → Logs):

**Ver Todas as Solicitações**:
```kusto
requests
| where timestamp > ago(1h)
| order by timestamp desc
| project timestamp, name, url, resultCode, duration
```

**Encontrar Erros**:
```kusto
exceptions
| where timestamp > ago(24h)
| order by timestamp desc
| project timestamp, type, outerMessage, operation_Name
```

**Verificar Endpoint de Saúde**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### Auditoria da Base de Dados SQL

**A auditoria da Base de Dados SQL está ativada** para rastrear:
- Padrões de acesso à base de dados
- Tentativas de login falhadas
- Alterações no esquema
- Acesso a dados (para conformidade)

**Aceder aos Registos de Auditoria**:
1. Portal Azure → Base de Dados SQL → Auditoria
2. Veja os registos no Log Analytics workspace

### Monitorização em Tempo Real

**Ver Métricas ao Vivo**:
1. Application Insights → Live Metrics
2. Veja solicitações, falhas e desempenho em tempo real

**Configurar Alertas**:
Crie alertas para eventos críticos:
- Erros HTTP 500 > 5 em 5 minutos
- Falhas na conexão à base de dados
- Tempos de resposta elevados (>2 segundos)

**Exemplo de Criação de Alerta**:
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```

## Resolução de Problemas

### Problemas Comuns e Soluções

#### 1. `azd provision` falha com "Localização não disponível"

**Sintoma**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**Solução**:
Escolha uma região diferente do Azure ou registe o fornecedor de recursos:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. Falha na Conexão SQL Durante a Implementação

**Sintoma**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**Solução**:
- Verifique se o firewall do SQL Server permite serviços do Azure (configurado automaticamente)
- Confirme se a palavra-passe do administrador SQL foi inserida corretamente durante o `azd provision`
- Certifique-se de que o SQL Server está totalmente provisionado (pode levar 2-3 minutos)

**Verificar Conexão**:
```sh
# No Portal do Azure, vá para Base de Dados SQL → Editor de consultas
# Tente conectar-se com as suas credenciais
```

#### 3. Aplicação Web Mostra "Erro de Aplicação"

**Sintoma**:
O navegador exibe uma página de erro genérica.

**Solução**:
Verifique os registos da aplicação:
```sh
# Ver registos recentes
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**Causas comuns**:
- Variáveis de ambiente em falta (verifique App Service → Configuração)
- Falha na instalação de pacotes Python (verifique os registos de implementação)
- Erro na inicialização da base de dados (verifique a conectividade SQL)

#### 4. `azd deploy` falha com "Erro de Construção"

**Sintoma**:
```
Error: Failed to build project
```

**Solução**:
- Certifique-se de que o `requirements.txt` não tem erros de sintaxe
- Verifique se o Python 3.11 está especificado em `infra/resources/web-app.bicep`
- Confirme que o Dockerfile tem a imagem base correta

**Depurar localmente**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. "Não autorizado" ao executar comandos AZD

**Sintoma**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**Solução**:
Reautentique-se com o Azure:
```sh
azd auth login
az login
```

Verifique se tem as permissões corretas (função de Contribuidor) na subscrição.

#### 6. Custos Elevados de Base de Dados

**Sintoma**:
Fatura inesperada do Azure.

**Solução**:
- Verifique se se esqueceu de executar `azd down` após os testes
- Confirme se a base de dados SQL está a usar o nível Básico (não Premium)
- Revise os custos no Azure Cost Management
- Configure alertas de custos

### Obter Ajuda

**Ver Todas as Variáveis de Ambiente AZD**:
```sh
azd env get-values
```

**Verificar Estado da Implementação**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**Aceder aos Registos da Aplicação**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**Precisa de Mais Ajuda?**
- [Guia de Resolução de Problemas AZD](../../docs/troubleshooting/common-issues.md)
- [Resolução de Problemas do Azure App Service](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Resolução de Problemas do Azure SQL](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Exercícios Práticos

### Exercício 1: Verificar a Sua Implementação (Iniciante)

**Objetivo**: Confirmar que todos os recursos estão implementados e que a aplicação está a funcionar.

**Passos**:
1. Liste todos os recursos no seu grupo de recursos:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **Esperado**: 6-7 recursos (Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

2. Teste todos os endpoints da API:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **Esperado**: Todos retornam JSON válido sem erros

3. Verifique o Application Insights:
   - Navegue até ao Application Insights no Portal do Azure
   - Vá para "Live Metrics"
   - Atualize o navegador na aplicação web
   **Esperado**: Ver pedidos a aparecer em tempo real

**Critérios de Sucesso**: Todos os 6-7 recursos existem, todos os endpoints retornam dados, Live Metrics mostra atividade.

---

### Exercício 2: Adicionar um Novo Endpoint API (Intermediário)

**Objetivo**: Expandir a aplicação Flask com um novo endpoint.

**Código Inicial**: Endpoints atuais em `src/web/app.py`

**Passos**:
1. Edite `src/web/app.py` e adicione um novo endpoint após a função `get_product()`:
   ```python
   @app.route('/products/search/<keyword>')
   def search_products(keyword):
       """Search products by name or description."""
       try:
           conn = get_db_connection()
           cursor = conn.cursor()
           cursor.execute(
               "SELECT id, name, description, price, created_at FROM products WHERE name LIKE ? OR description LIKE ?",
               (f'%{keyword}%', f'%{keyword}%')
           )
           
           products = []
           for row in cursor.fetchall():
               products.append({
                   'id': row[0],
                   'name': row[1],
                   'description': row[2],
                   'price': float(row[3]) if row[3] else None,
                   'created_at': row[4].isoformat() if row[4] else None
               })
           
           cursor.close()
           conn.close()
           
           logger.info(f"Search for '{keyword}' returned {len(products)} results")
           return jsonify(products), 200
           
       except Exception as e:
           logger.error(f"Error searching products: {str(e)}")
           return jsonify({'error': str(e)}), 500
   ```

2. Implemente a aplicação atualizada:
   ```sh
   azd deploy
   ```

3. Teste o novo endpoint:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **Esperado**: Retorna produtos correspondentes a "laptop"

**Critérios de Sucesso**: O novo endpoint funciona, retorna resultados filtrados, aparece nos registos do Application Insights.

---

### Exercício 3: Adicionar Monitorização e Alertas (Avançado)

**Objetivo**: Configurar monitorização proativa com alertas.

**Passos**:
1. Crie um alerta para erros HTTP 500:
   ```sh
   # Obter ID do recurso do Application Insights
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # Criar alerta
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```

2. Dispare o alerta causando erros:
   ```sh
   # Solicitar um produto inexistente
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. Verifique se o alerta foi acionado:
   - Portal do Azure → Alertas → Regras de Alerta
   - Verifique o seu email (se configurado)

**Critérios de Sucesso**: A regra de alerta foi criada, é acionada por erros, notificações são recebidas.

---

### Exercício 4: Alterações no Esquema da Base de Dados (Avançado)

**Objetivo**: Adicionar uma nova tabela e modificar a aplicação para utilizá-la.

**Passos**:
1. Conecte-se à base de dados SQL através do Editor de Consultas do Portal do Azure

2. Crie uma nova tabela `categories`:
   ```sql
   CREATE TABLE categories (
       id INT PRIMARY KEY IDENTITY(1,1),
       name NVARCHAR(50) NOT NULL,
       description NVARCHAR(200)
   );
   
   INSERT INTO categories (name, description) VALUES
   ('Electronics', 'Electronic devices and accessories'),
   ('Office Supplies', 'Office equipment and supplies');
   
   -- Add category to products table
   ALTER TABLE products ADD category_id INT;
   UPDATE products SET category_id = 1; -- Set all to Electronics
   ```

3. Atualize `src/web/app.py` para incluir informações de categoria nas respostas

4. Implemente e teste

**Critérios de Sucesso**: A nova tabela existe, os produtos mostram informações de categoria, a aplicação continua a funcionar.

---

### Exercício 5: Implementar Cache (Especialista)

**Objetivo**: Adicionar Azure Redis Cache para melhorar o desempenho.

**Passos**:
1. Adicione Redis Cache a `infra/main.bicep`
2. Atualize `src/web/app.py` para armazenar em cache as consultas de produtos
3. Meça a melhoria de desempenho com o Application Insights
4. Compare os tempos de resposta antes/depois do cache

**Critérios de Sucesso**: Redis está implementado, o cache funciona, os tempos de resposta melhoram >50%.

**Dica**: Comece com [documentação do Azure Cache for Redis](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## Limpeza

Para evitar custos contínuos, elimine todos os recursos ao terminar:

```sh
azd down
```

**Prompt de Confirmação**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

Digite `y` para confirmar.

**✓ Verificação de Sucesso**: 
- Todos os recursos são eliminados do Portal do Azure
- Sem custos contínuos
- A pasta local `.azure/<env-name>` pode ser eliminada

**Alternativa** (manter infraestrutura, eliminar dados):
```sh
# Eliminar apenas o grupo de recursos (manter a configuração AZD)
az group delete --name rg-<env-name> --yes
```
## Saiba Mais

### Documentação Relacionada
- [Documentação do Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Documentação do Azure SQL Database](https://learn.microsoft.com/azure/azure-sql/database/)
- [Documentação do Azure App Service](https://learn.microsoft.com/azure/app-service/)
- [Documentação do Application Insights](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Referência da Linguagem Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### Próximos Passos Neste Curso
- **[Exemplo de Aplicações em Contêiner](../../../../examples/container-app)**: Implementar microserviços com Azure Container Apps
- **[Guia de Integração de IA](../../../../docs/ai-foundry)**: Adicionar capacidades de IA à sua aplicação
- **[Melhores Práticas de Implementação](../../docs/deployment/deployment-guide.md)**: Padrões de implementação em produção

### Tópicos Avançados
- **Identidade Gerida**: Eliminar palavras-passe e usar autenticação Azure AD
- **Endpoints Privados**: Proteger conexões de base de dados dentro de uma rede virtual
- **Integração CI/CD**: Automatizar implementações com GitHub Actions ou Azure DevOps
- **Multi-Ambiente**: Configurar ambientes de desenvolvimento, staging e produção
- **Migrações de Base de Dados**: Usar Alembic ou Entity Framework para versionamento de esquemas

### Comparação com Outras Abordagens

**AZD vs. ARM Templates**:
- ✅ AZD: Abstração de nível superior, comandos mais simples
- ⚠️ ARM: Mais detalhado, controlo granular

**AZD vs. Terraform**:
- ✅ AZD: Nativo do Azure, integrado com serviços Azure
- ⚠️ Terraform: Suporte multi-cloud, ecossistema maior

**AZD vs. Portal do Azure**:
- ✅ AZD: Repetível, controlado por versão, automatizável
- ⚠️ Portal: Cliques manuais, difícil de reproduzir

**Pense no AZD como**: Docker Compose para Azure—configuração simplificada para implementações complexas.

---

## Perguntas Frequentes

**P: Posso usar uma linguagem de programação diferente?**  
R: Sim! Substitua `src/web/` por Node.js, C#, Go ou qualquer linguagem. Atualize `azure.yaml` e Bicep conforme necessário.

**P: Como adiciono mais bases de dados?**  
R: Adicione outro módulo SQL Database em `infra/main.bicep` ou use PostgreSQL/MySQL dos serviços de base de dados do Azure.

**P: Posso usar isto para produção?**  
R: Este é um ponto de partida. Para produção, adicione: identidade gerida, endpoints privados, redundância, estratégia de backup, WAF e monitorização avançada.

**P: E se eu quiser usar contêineres em vez de implementação de código?**  
R: Veja o [Exemplo de Aplicações em Contêiner](../../../../examples/container-app) que usa contêineres Docker em todo o processo.

**P: Como me conecto à base de dados a partir da minha máquina local?**  
R: Adicione o seu IP ao firewall do SQL Server:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**P: Posso usar uma base de dados existente em vez de criar uma nova?**  
R: Sim, modifique `infra/main.bicep` para referenciar um SQL Server existente e atualize os parâmetros da string de conexão.

---

> **Nota:** Este exemplo demonstra as melhores práticas para implementar uma aplicação web com uma base de dados usando AZD. Inclui código funcional, documentação abrangente e exercícios práticos para reforçar o aprendizado. Para implementações em produção, revise os requisitos de segurança, escalabilidade, conformidade e custos específicos da sua organização.

**📚 Navegação do Curso:**
- ← Anterior: [Exemplo de Aplicações em Contêiner](../../../../examples/container-app)
- → Próximo: [Guia de Integração de IA](../../../../docs/ai-foundry)
- 🏠 [Página Inicial do Curso](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original no seu idioma nativo deve ser considerado a fonte autoritária. Para informações críticas, recomenda-se uma tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->