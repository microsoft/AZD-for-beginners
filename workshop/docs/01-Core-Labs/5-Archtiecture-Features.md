# Lab 05: Try Template Features

!!! quote "BY THE END OF THIS LAB YOU SHOULD HAVE"
    - [ ] Explored the default AI Agent Capabilities
    - [ ] Added AI Search with your own index
    - [ ] Activated and analyzed Tracing metrics
    - [ ] Executed an evaluation run
    - [ ] Executed a red-teaming scan

---

## 1. AI Agent Capabilities

!!! success "We completed this in Lab 01"

- **File Search**: OpenAI's built-in file search for knowledge retrieval
- **Citations**: Automatic source attribution in responses
- **Customizable Instructions**: Modify agent behavior and personality
- **Tool Integration**: Extensible tool system for custom capabilities

---

## 2. Knowledge Retrieval Options

!!! task "To complete this we need to make changes and redeploy"    
    
    ```bash title=""
    # Set environment variables
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # Upload data and create my index

    ```

---

**OpenAI File Search (Default):**

- Built-in to Azure AI Agent service
- Automatic document processing and indexing
- No additional configuration required

**Azure AI Search (Optional):**

- Hybrid semantic and vector search
- Custom index management
- Advanced search capabilities
- Requires `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 3. [Tracing & Monitoring](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "To complete this we need to make changes and redeploy"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Tracing:**

- OpenTelemetry integration
- Request/response tracking
- Performance metrics
- Available in AI Foundry portal

**Logging:**

- Application logs in Container Apps
- Structured logging with correlation IDs
- Real-time and historical log viewing

---

## 4. [Agent Evaluation](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Local Evaluation:**

- Built-in evaluators for quality assessment
- Custom evaluation scripts
- Performance benchmarking

**Continuous Monitoring:**

- Automatic evaluation of live interactions
- Quality metrics tracking
- Performance regression detection

**CI/CD Integration:**

- GitHub Actions workflow
- Automated testing and evaluation
- Statistical comparison testing

---

## 5. [AI Red Teaming Agent](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI Red Teaming:**

- Automated security scanning
- Risk assessment for AI systems
- Safety evaluation across multiple categories

**Authentication:**

- Managed Identity for Azure services
- Optional Azure App Service authentication
- Basic auth fallback for development