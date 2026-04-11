# Implantação de uma Base de Dados Microsoft SQL e Aplicação Web com AZD

⏱️ **Tempo Estimado**: 20-30 minutos | 💰 **Custo Estimado**: ~$15-25/mês | ⭐ **Complexidade**: Intermédia

Este **exemplo completo e funcional** demonstra como usar o [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) para implantar uma aplicação web Python Flask com uma Base de Dados Microsoft SQL no Azure. Todo o código está incluído e testado—sem dependências externas necessárias.

## O Que Vai Aprender

Ao completar este exemplo, vai:
- Implantar uma aplicação multicamadas (aplicação web + base de dados) usando infraestrutura como código
- Configurar conexões seguras à base de dados sem codificar segredos no código fonte
- Monitorizar a saúde da aplicação com Application Insights
- Gerir recursos Azure eficientemente com a interface AZD CLI
- Seguir as melhores práticas Azure para segurança, otimização de custos e observabilidade

## Visão Geral do Cenário
- **Aplicação Web**: API REST Python Flask com conectividade à base de dados
- **Base de Dados**: Base de Dados Azure SQL com dados de exemplo
- **Infraestrutura**: Provisionada usando Bicep (modelos modulares e reutilizáveis)
- **Implantação**: Totalmente automática com comandos `azd`
- **Monitorização**: Application Insights para registos e telemetria

## Pré-requisitos

### Ferramentas Necessárias

Antes de começar, confirme que tem estas ferramentas instaladas:

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

4. **[Docker](https://www.docker.com/get-started)** (opcional, para desenvolvimento local com contentores)
   ```sh
   docker --version
   # Saída esperada: Versão do Docker 20.10 ou superior
   ```

### Requisitos Azure

- Uma **subscrição Azure ativa** ([crie uma conta gratuita](https://azure.microsoft.com/free/))
- Permissões para criar recursos na subscrição
- Papel de **Proprietário** ou **Contribuidor** na subscrição ou grupo de recursos

### Conhecimentos Pré-requisitos

Este é um exemplo de nível **intermédio**. Deve estar familiarizado com:
- Operações básicas de linha de comando
- Conceitos fundamentais da cloud (recursos, grupos de recursos)
- Noções básicas de aplicações web e bases de dados

**Novo no AZD?** Comece pelo [guia de Introdução](../../docs/chapter-01-foundation/azd-basics.md).

## Arquitetura

Este exemplo implanta uma arquitetura de dois níveis com aplicação web e base de dados SQL:

```mermaid
graph TD
    Browser[Navegador do Utilizador] <--> WebApp[Aplicação Web Azure<br/>API Flask<br/>/health<br/>/products]
    WebApp -- Ligação Segura<br/>Encriptada --> SQL[Base de Dados SQL Azure<br/>Tabela de Produtos<br/>Dados de exemplo]
```
**Implantação de Recursos:**
- **Grupo de Recursos**: Contém todos os recursos
- **Plano App Service**: Hospedagem baseada em Linux (nível B1 para eficiência de custos)
- **Aplicação Web**: Runtime Python 3.11 com aplicação Flask
- **Servidor SQL**: Servidor de base de dados gerido com TLS 1.2 mínimo
- **Base de Dados SQL**: Nível básico (2GB, adequado para desenvolvimento/testes)
- **Application Insights**: Monitorização e registo
- **Workspace Log Analytics**: Armazenamento centralizado de registos

**Analogia**: Pense nisto como um restaurante (app web) com um congelador (base de dados). Os clientes fazem encomendas do menu (endpoints da API), e a cozinha (app Flask) obtém ingredientes (dados) do congelador. O gerente do restaurante (Application Insights) acompanha tudo o que acontece.

## Estrutura de Pastas

Todos os ficheiros estão incluídos neste exemplo—sem dependências externas:

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

**Função de Cada Ficheiro:**
- **azure.yaml**: Diz ao AZD o que implantar e onde
- **infra/main.bicep**: Orquestra todos os recursos Azure
- **infra/resources/*.bicep**: Definições individuais de recursos (modulares para reutilização)
- **src/web/app.py**: Aplicação Flask com lógica de base de dados
- **requirements.txt**: Dependências de pacotes Python
- **Dockerfile**: Instruções para conteinerização e implantação

## Início Rápido (Passo a Passo)

### Passo 1: Clonar e Aceder

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Verificação de Sucesso**: Verifique que vê `azure.yaml` e a pasta `infra/`:
```sh
ls
# Esperado: README.md, azure.yaml, infra/, src/
```

### Passo 2: Autenticar no Azure

```sh
azd auth login
```

Isto abre o seu navegador para autenticação no Azure. Entre com as suas credenciais Azure.

**✓ Verificação de Sucesso**: Deve ver:
```
Logged in to Azure.
```

### Passo 3: Inicializar o Ambiente

```sh
azd init
```

**O que acontece**: O AZD cria uma configuração local para a sua implantação.

**Perguntas que vai receber**:
- **Nome do ambiente**: Insira um nome curto (ex.: `dev`, `myapp`)
- **Subscrição Azure**: Selecione a sua subscrição da lista
- **Localização Azure**: Escolha uma região (ex.: `eastus`, `westeurope`)

**✓ Verificação de Sucesso**: Deve ver:
```
SUCCESS: New project initialized!
```

### Passo 4: Provisionar Recursos Azure

```sh
azd provision
```

**O que acontece**: O AZD implanta toda a infraestrutura (demora 5-8 minutos):
1. Cria o grupo de recursos
2. Cria o servidor SQL e base de dados
3. Cria o plano App Service
4. Cria a aplicação web
5. Cria o Application Insights
6. Configura redes e segurança

**Irá receber perguntas para**:
- **Nome de utilizador admin SQL**: Insira um nome de utilizador (ex.: `sqladmin`)
- **Password admin SQL**: Insira uma password forte (guarde-a!)

**✓ Verificação de Sucesso**: Deve ver:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Tempo**: 5-8 minutos

### Passo 5: Implantar a Aplicação

```sh
azd deploy
```

**O que acontece**: O AZD constrói e implanta a aplicação Flask:
1. Empacota a aplicação Python
2. Constrói o contentor Docker
3. Envia para a App Web Azure
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

Isto abre a sua aplicação web implantada no navegador em `https://app-<unique-id>.azurewebsites.net`

**✓ Verificação de Sucesso**: Deve ver output JSON:
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

**Verificação de Saúde** (confirme a ligação à base de dados):
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

**Obter Produto Individual**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ Verificação de Sucesso**: Todos os endpoints retornam dados JSON sem erros.

---

**🎉 Parabéns!** Implantou com sucesso uma aplicação web com base de dados no Azure usando AZD.

## Análise Profunda da Configuração

### Variáveis de Ambiente

Os segredos são geridos de forma segura via configuração do Azure App Service—**nunca codificados no código fonte**.

**Configurado Automaticamente pelo AZD**:
- `SQL_CONNECTION_STRING`: Ligação à base de dados com credenciais encriptadas
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: Ponto de extremidade da telemetria de monitorização
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Permite instalação automática de dependências

**Onde os Segredos São Armazenados**:
1. Durante `azd provision`, fornece credenciais SQL via prompts seguros
2. O AZD guarda-os no ficheiro local `.azure/<env-name>/.env` (ignorado pelo git)
3. O AZD injeta-os na configuração do Azure App Service (encriptados em repouso)
4. A aplicação lê-os via `os.getenv()` em tempo de execução

### Desenvolvimento Local

Para testes locais, crie um ficheiro `.env` a partir do exemplo:

```sh
cp .env.sample .env
# Edite o .env com a conexão à sua base de dados local
```

**Fluxo de Trabalho para Desenvolvimento Local**:
```sh
# Instalar dependências
cd src/web
pip install -r requirements.txt

# Definir variáveis de ambiente
export SQL_CONNECTION_STRING="your-local-connection-string"

# Executar a aplicação
python app.py
```

**Teste localmente**:
```sh
curl http://localhost:8000/health
# Esperado: {"status": "healthy", "database": "connected"}
```

### Infraestrutura como Código

Todos os recursos Azure estão definidos em **templates Bicep** (pasta `infra/`):

- **Design Modular**: Cada tipo de recurso tem o seu próprio ficheiro para reutilização
- **Parametrizado**: Personalize SKUs, regiões, convenções de nomeação
- **Melhores Práticas**: Segue normas Azure de nomeação e segurança por defeito
- **Controlado por Versões**: Alterações da infraestrutura são rastreadas em Git

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

Este exemplo segue as melhores práticas de segurança Azure:

### 1. **Sem Segredos no Código Fonte**
- ✅ Credenciais armazenadas na configuração do Azure App Service (encriptadas)
- ✅ Ficheiros `.env` excluídos do Git via `.gitignore`
- ✅ Segredos passados via parâmetros seguros durante o provisionamento

### 2. **Conexões Encriptadas**
- ✅ TLS 1.2 mínimo para o servidor SQL
- ✅ HTTPS apenas reforçado para a App Web
- ✅ Ligações à base de dados usam canais encriptados

### 3. **Segurança de Rede**
- ✅ Firewall do servidor SQL configurado para permitir apenas serviços Azure
- ✅ Acesso público restrito (pode ser bloqueado com Endpoints Privados)
- ✅ FTPS desativado na App Web

### 4. **Autenticação & Autorização**
- ⚠️ **Atual**: Autenticação SQL (utilizador/password)
- ✅ **Recomendação para produção**: Use Identidade Gerida Azure para autenticação sem password

**Para migrar para Identidade Gerida** (em produção):
1. Ative a identidade gerida na App Web
2. Conceda permissões SQL à identidade
3. Atualize a cadeia de ligação para usar identidade gerida
4. Remova autenticação por password

### 5. **Auditoria & Conformidade**
- ✅ Application Insights regista todos os pedidos e erros
- ✅ Auditoria da base de dados SQL ativada (configurável para conformidade)
- ✅ Todos os recursos etiquetados para governança

**Lista de Verificação de Segurança Antes de Produção**:
- [ ] Ativar Azure Defender para SQL
- [ ] Configurar Endpoints Privados para a Base de Dados SQL
- [ ] Ativar Web Application Firewall (WAF)
- [ ] Implementar Azure Key Vault para rotação de segredos
- [ ] Configurar autenticação Azure AD
- [ ] Ativar registo diagnóstico para todos os recursos

## Otimização de Custos

**Custos Mensais Estimados** (em novembro de 2025):

| Recurso | SKU/Nível | Custo Estimado |
|----------|----------|----------------|
| Plano App Service | B1 (Básico) | ~$13/mês |
| Base de Dados SQL | Básico (2GB) | ~$5/mês |
| Application Insights | Pay-as-you-go | ~$2/mês (baixo tráfego) |
| **Total** | | **~$20/mês** |

**💡 Dicas para Poupar Custos**:

1. **Use o Nível Gratuito para Aprender**:
   - App Service: nível F1 (grátis, horas limitadas)
   - Base de Dados SQL: use Azure SQL Database serverless
   - Application Insights: 5GB/mês ingestão gratuita

2. **Pare Recursos Quando Não Usar**:
   ```sh
   # Parar a aplicação web (a base de dados continua a ser cobrada)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # Reiniciar quando necessário
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **Apague Tudo Após Testes**:
   ```sh
   azd down
   ```
   Isto remove TODOS os recursos e para as cobranças.

4. **SKUs para Desenvolvimento vs Produção**:
   - **Desenvolvimento**: nível básico (usado neste exemplo)
   - **Produção**: nível Standard/Premium com redundância

**Monitorização de Custos**:
- Veja custos em [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- Configure alertas de custo para evitar surpresas
- Etiquete todos os recursos com `azd-env-name` para rastreamento

**Alternativa de Nível Gratuito**:
Para fins de aprendizagem, pode modificar `infra/resources/app-service-plan.bicep`:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Nota**: O nível gratuito tem limitações (60 min/dia CPU, sem always-on).

## Monitorização & Observabilidade

### Integração com Application Insights

Este exemplo inclui **Application Insights** para monitorização abrangente:

**O Que é Monitorizado**:
- ✅ Pedidos HTTP (latência, códigos de estado, endpoints)
- ✅ Erros e excepções da aplicação
- ✅ Registo personalizado da aplicação Flask
- ✅ Saúde da ligação à base de dados
- ✅ Métricas de desempenho (CPU, memória)

**Aceder a Application Insights**:
1. Abra o [Portal Azure](https://portal.azure.com)
2. Navegue para o grupo de recursos (`rg-<env-name>`)
3. Clique no recurso Application Insights (`appi-<unique-id>`)

**Consultas Úteis** (Application Insights → Logs):

**Ver Todos os Pedidos**:
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

**Auditoria da base de dados SQL está ativada** para rastrear:
- Padrões de acesso à base de dados
- Tentativas de login falhadas
- Alterações ao esquema
- Acesso a dados (para conformidade)

**Aceder a Registos de Auditoria**:
1. Portal Azure → Base de Dados SQL → Auditoria
2. Veja os registos no workspace Log Analytics

### Monitorização em Tempo Real

**Ver Métricas ao Vivo**:
1. Application Insights → Métricas ao vivo
2. Visualize pedidos, falhas e desempenho em tempo real

**Configurar Alertas**:
Crie alertas para eventos críticos:
- Erros HTTP 500 > 5 em 5 minutos
- Falhas na ligação à base de dados
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

#### 1. `azd provision` falha com "Location not available"

**Sintoma**:  
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```
  
**Solução**:  
Escolha uma região Azure diferente ou registe o fornecedor de recursos:  
```sh
az provider register --namespace Microsoft.Insights
```
  
#### 2. Falha na conexão SQL Durante o Deployment

**Sintoma**:  
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```
  
**Solução**:  
- Verifique se o firewall do SQL Server permite serviços Azure (configurado automaticamente)  
- Confirme que a password do admin SQL foi introduzida corretamente durante o `azd provision`  
- Assegure que o SQL Server está totalmente provisionado (pode demorar 2-3 minutos)  

**Verificar Conexão**:  
```sh
# No Portal Azure, vá para Base de Dados SQL → Editor de consultas
# Tente ligar com as suas credenciais
```
  
#### 3. Web App Mostra "Application Error"

**Sintoma**:  
O navegador mostra uma página de erro genérica.

**Solução**:  
Verifique os logs da aplicação:  
```sh
# Ver registos recentes
az webapp log tail --name <app-name> --resource-group <rg-name>
```
  
**Causas comuns**:  
- Variáveis de ambiente em falta (verifique App Service → Configuração)  
- Falha na instalação do pacote Python (verifique logs de deployment)  
- Erro na inicialização da base de dados (verifique conectividade SQL)  

#### 4. `azd deploy` Falha com "Build Error"

**Sintoma**:  
```
Error: Failed to build project
```
  
**Solução**:  
- Assegure que `requirements.txt` não tem erros de sintaxe  
- Verifique se o Python 3.11 está especificado em `infra/resources/web-app.bicep`  
- Confirme que o Dockerfile usa a imagem base correta  

**Debug localmente**:  
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```
  
#### 5. "Unauthorized" Quando a Executar Comandos AZD

**Sintoma**:  
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```
  
**Solução**:  
Re-autentique-se com Azure:  
```sh
# Necessário para fluxos de trabalho AZD
azd auth login

# Opcional se também estiver a usar comandos Azure CLI diretamente
az login
```
  
Verifique se tem as permissões corretas (função de Contribuidor) na subscrição.

#### 6. Custos Elevados na Base de Dados

**Sintoma**:  
Fatura Azure inesperada.

**Solução**:  
- Verifique se esqueceu de executar `azd down` após os testes  
- Confirme se a base de dados SQL está a usar o nível Básico (não Premium)  
- Reveja os custos no Azure Cost Management  
- Configure alertas de custo  

### Obter Ajuda

**Ver Todas as Variáveis de Ambiente AZD**:  
```sh
azd env get-values
```
  
**Verificar Estado do Deployment**:  
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```
  
**Aceder aos Logs da Aplicação**:  
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```
  
**Precisa de Mais Ajuda?**  
- [Guia de Resolução de Problemas AZD](../../docs/chapter-07-troubleshooting/common-issues.md)  
- [Resolução de Problemas Azure App Service](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)  
- [Resolução de Problemas Azure SQL](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)  

## Exercícios Práticos

### Exercício 1: Verificar o Seu Deployment (Iniciante)

**Objetivo**: Confirmar que todos os recursos estão implementados e a aplicação está a funcionar.

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
   - Navegue para Application Insights no Azure Portal  
   - Vá a "Live Metrics"  
   - Atualize o navegador no web app  
   **Esperado**: Ver pedidos a aparecer em tempo real  

**Critérios de Sucesso**: Existência de todos os 6-7 recursos, todos os endpoints retornam dados, Live Metrics mostra atividade.

---

### Exercício 2: Adicionar um Novo Endpoint API (Intermédio)

**Objetivo**: Estender a aplicação Flask com um novo endpoint.

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
  
2. Faça o deploy da aplicação atualizada:  
   ```sh
   azd deploy
   ```
  
3. Teste o novo endpoint:  
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **Esperado**: Retorna produtos que correspondem a "laptop"  

**Critérios de Sucesso**: Novo endpoint funcionando, retorna resultados filtrados, aparece nos logs do Application Insights.

---

### Exercício 3: Adicionar Monitorização e Alertas (Avançado)

**Objetivo**: Configurar monitorização proativa com alertas.

**Passos**:  
1. Crie um alerta para erros HTTP 500:  
   ```sh
   # Obter o ID do recurso do Application Insights
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
   - Azure Portal → Alerts → Alert Rules  
   - Verifique o seu email (se configurado)  

**Critérios de Sucesso**: A regra de alerta é criada, dispara em erros, notificações são recebidas.

---

### Exercício 4: Alterações ao Esquema da Base de Dados (Avançado)

**Objetivo**: Adicionar uma nova tabela e modificar a aplicação para a usar.

**Passos**:  
1. Conecte-se à base de dados SQL via Query Editor do Azure Portal  

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
  
3. Atualize `src/web/app.py` para incluir informação de categoria nas respostas  

4. Faça deploy e teste  

**Critérios de Sucesso**: Nova tabela existe, produtos mostram informação de categoria, aplicação continua a funcionar.

---

### Exercício 5: Implementar Caching (Especialista)

**Objetivo**: Adicionar o Azure Redis Cache para melhorar desempenho.

**Passos**:  
1. Adicione Redis Cache em `infra/main.bicep`  
2. Atualize `src/web/app.py` para guardar em cache as consultas de produtos  
3. Meça a melhoria de desempenho com Application Insights  
4. Compare os tempos de resposta antes e depois do caching  

**Critérios de Sucesso**: Redis é implementado, caching funciona, tempos de resposta melhoram >50%.

**Dica**: Comece com a [documentação do Azure Cache for Redis](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## Limpeza

Para evitar cobranças contínuas, elimine todos os recursos após terminar:

```sh
azd down
```
  
**Prompt de confirmação**:  
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```
  
Digite `y` para confirmar.

**✓ Verificação de Sucesso**:  
- Todos os recursos foram eliminados do Azure Portal  
- Sem cobranças contínuas  
- Pasta local `.azure/<env-name>` pode ser eliminada  

**Alternativa** (manter infraestrutura, eliminar dados):  
```sh
# Apagar apenas o grupo de recursos (manter a configuração AZD)
az group delete --name rg-<env-name> --yes
```
## Saiba Mais

### Documentação Relacionada
- [Documentação Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)  
- [Documentação Azure SQL Database](https://learn.microsoft.com/azure/azure-sql/database/)  
- [Documentação Azure App Service](https://learn.microsoft.com/azure/app-service/)  
- [Documentação Application Insights](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)  
- [Referência da Linguagem Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)  

### Próximos Passos Neste Curso
- **[Exemplo Container Apps](../../../../examples/container-app)**: Implementar microserviços com Azure Container Apps  
- **[Guia de Integração AI](../../../../docs/ai-foundry)**: Adicionar capacidades AI à sua app  
- **[Melhores Práticas de Deployment](../../docs/chapter-04-infrastructure/deployment-guide.md)**: Padrões para deployment em produção  

### Tópicos Avançados
- **Managed Identity**: Eliminar passwords e usar autenticação Azure AD  
- **Private Endpoints**: Proteger ligações à base de dados dentro da rede virtual  
- **Integração CI/CD**: Automatizar deployments com GitHub Actions ou Azure DevOps  
- **Multi-Environment**: Configurar ambientes dev, staging e produção  
- **Migrações de Base de Dados**: Usar Alembic ou Entity Framework para versionamento do esquema  

### Comparação com Outras Abordagens

**AZD vs. ARM Templates**:  
- ✅ AZD: Abstração a nível superior, comandos mais simples  
- ⚠️ ARM: Mais detalhado, controlo granular  

**AZD vs. Terraform**:  
- ✅ AZD: Nativo Azure, integrado com serviços Azure  
- ⚠️ Terraform: Multi-cloud, maior ecossistema  

**AZD vs. Azure Portal**:  
- ✅ AZD: Repetível, controlado por versões, automatizável  
- ⚠️ Portal: Cliques manuais, menos reprodutível  

**Pense no AZD como**: Docker Compose para Azure — configuração simplificada para deployments complexos.

---

## Perguntas Frequentes

**Q: Posso usar uma linguagem de programação diferente?**  
R: Sim! Substitua `src/web/` por Node.js, C#, Go, ou qualquer linguagem. Atualize `azure.yaml` e Bicep em conformidade.

**Q: Como adiciono mais bases de dados?**  
R: Adicione outro módulo SQL Database em `infra/main.bicep` ou use PostgreSQL/MySQL dos serviços Azure Database.

**Q: Posso usar isto em produção?**  
R: Isto é um ponto de partida. Para produção, adicione: managed identity, private endpoints, redundância, estratégia de backup, WAF, e monitorização avançada.

**Q: E se quiser usar containers em vez de deploy de código?**  
R: Veja o [Exemplo Container Apps](../../../../examples/container-app) que usa containers Docker em todo o processo.

**Q: Como conecto à base de dados a partir da minha máquina local?**  
R: Adicione o seu IP ao firewall do SQL Server:  
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```
  
**Q: Posso usar uma base de dados existente em vez de criar uma nova?**  
R: Sim, modifique `infra/main.bicep` para referenciar um SQL Server existente e atualize os parâmetros da string de ligação.

---

> **Nota:** Este exemplo demonstra as melhores práticas para deploy de uma aplicação web com base de dados usando AZD. Inclui código funcional, documentação abrangente, e exercícios práticos para reforçar o aprendizado. Para deploys em produção, reveja requisitos de segurança, escalabilidade, conformidade e custos específicos da sua organização.

**📚 Navegação do Curso:**  
- ← Anterior: [Exemplo Container Apps](../../../../examples/container-app)  
- → Seguinte: [Guia de Integração AI](../../../../docs/ai-foundry)  
- 🏠 [Início do Curso](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos por garantir a precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se a tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->